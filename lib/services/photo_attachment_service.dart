part of '../main.dart';

enum PhotoAttachmentAction { camera, gallery }

enum PhotoAttachmentResult { attached, cancelled, unsupported }

abstract final class PhotoOwnerType {
  static const inboxItem = 'inbox_item';
  static const runItem = 'run_item';
  static const processingItem = 'processing_item';
  static const receipt = 'receipt';
  static const objectTemplate = 'object_template';
  static const yard = 'yard';
  static const vehicle = 'vehicle';
  static const assistantContext = 'assistant_context';
}

abstract interface class PhotoSourcePicker {
  Future<String?> capturePhoto();
  Future<String?> choosePhoto();
}

class ImagePickerPhotoSourcePicker implements PhotoSourcePicker {
  ImagePickerPhotoSourcePicker({ImagePicker? picker})
    : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  @override
  Future<String?> capturePhoto() async {
    if (!Platform.isAndroid) return null;
    return (await _picker.pickImage(source: ImageSource.camera))?.path;
  }

  @override
  Future<String?> choosePhoto() async {
    return (await _picker.pickImage(source: ImageSource.gallery))?.path;
  }
}

typedef PhotoStorageDirectoryProvider = Future<Directory> Function();

class PhotoAttachmentService {
  PhotoAttachmentService({
    PhotoSourcePicker? picker,
    PhotoStorageDirectoryProvider? storageDirectoryProvider,
    bool? cameraSupported,
  }) : _picker = picker ?? ImagePickerPhotoSourcePicker(),
       _storageDirectoryProvider =
           storageDirectoryProvider ?? getApplicationSupportDirectory,
       _cameraSupported = cameraSupported ?? Platform.isAndroid;

  final PhotoSourcePicker _picker;
  final PhotoStorageDirectoryProvider _storageDirectoryProvider;
  final bool _cameraSupported;

  Future<(PhotoAttachmentResult, PhotoAttachment?)> attach({
    required String ownerId,
    required String ownerType,
    required PhotoAttachmentAction action,
    String caption = '',
  }) async {
    if (action == PhotoAttachmentAction.camera && !_cameraSupported) {
      return (PhotoAttachmentResult.unsupported, null);
    }
    final sourcePath = action == PhotoAttachmentAction.camera
        ? await _picker.capturePhoto()
        : await _picker.choosePhoto();
    if (sourcePath == null || sourcePath.isEmpty) {
      return (PhotoAttachmentResult.cancelled, null);
    }

    final source = File(sourcePath);
    if (!await source.exists()) {
      return (PhotoAttachmentResult.cancelled, null);
    }
    final id = DateTime.now().microsecondsSinceEpoch.toString();
    final root = await _storageDirectoryProvider();
    final safeOwnerType = _safeSegment(ownerType);
    final safeOwnerId = _safeSegment(ownerId);
    final directory = Directory(
      path_util.join(root.path, 'photos', safeOwnerType, safeOwnerId),
    );
    await directory.create(recursive: true);
    final extension = path_util.extension(source.path).toLowerCase();
    final storedPath = path_util.join(
      directory.path,
      '$id${extension.isEmpty ? '.jpg' : extension}',
    );
    await source.copy(storedPath);
    return (
      PhotoAttachmentResult.attached,
      PhotoAttachment(
        id: id,
        ownerId: ownerId,
        ownerType: ownerType,
        localPath: storedPath,
        caption: caption,
        createdAt: DateTime.now(),
      ),
    );
  }

  List<PhotoAttachment> listForOwner(
    Iterable<PhotoAttachment> attachments, {
    required String ownerId,
    required String ownerType,
  }) =>
      attachments
          .where(
            (photo) => photo.ownerId == ownerId && photo.ownerType == ownerType,
          )
          .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  void updateCaption(
    List<PhotoAttachment> attachments, {
    required String attachmentId,
    required String caption,
  }) {
    attachments.firstWhere((photo) => photo.id == attachmentId).caption =
        caption.trim();
  }

  Future<void> delete(
    List<PhotoAttachment> attachments,
    PhotoAttachment attachment,
  ) async {
    final localPath = attachment.localPath;
    if (localPath != null && localPath.isNotEmpty) {
      final root = await _storageDirectoryProvider();
      final normalizedRoot = path_util.normalize(root.absolute.path);
      final normalizedFile = path_util.normalize(File(localPath).absolute.path);
      if (path_util.isWithin(normalizedRoot, normalizedFile)) {
        final file = File(normalizedFile);
        if (await file.exists()) await file.delete();
      }
    }
    attachments.removeWhere((photo) => photo.id == attachment.id);
  }

  Future<void> deleteForOwner(
    List<PhotoAttachment> attachments, {
    required String ownerId,
    required Iterable<String> ownerTypes,
  }) async {
    final types = ownerTypes.toSet();
    final matches = attachments
        .where(
          (photo) =>
              photo.ownerId == ownerId && types.contains(photo.ownerType),
        )
        .toList();
    for (final attachment in matches) {
      await delete(attachments, attachment);
    }
  }

  String _safeSegment(String value) =>
      value.replaceAll(RegExp('[^A-Za-z0-9._-]'), '_');
}

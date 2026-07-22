import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

final class ItemImageService {
  ItemImageService({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  bool get supportsCamera => Platform.isAndroid || Platform.isIOS;

  Future<String?> chooseFromGallery() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 88,
      maxWidth: 2048,
    );
    if (image == null) return null;
    return _storeLocally(image);
  }

  Future<String?> takePhoto() async {
    if (!supportsCamera) return null;

    final image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 88,
      maxWidth: 2048,
    );
    if (image == null) return null;
    return _storeLocally(image);
  }

  Future<String> _storeLocally(XFile image) async {
    final support = await getApplicationSupportDirectory();
    final directory = Directory(p.join(support.path, 'item_advisor_images'));
    await directory.create(recursive: true);

    final extension = p.extension(image.path).isEmpty
        ? '.jpg'
        : p.extension(image.path).toLowerCase();
    final filename = 'item_${DateTime.now().microsecondsSinceEpoch}$extension';
    final destination = p.join(directory.path, filename);

    await File(image.path).copy(destination);
    return destination;
  }

  Future<void> deleteLocalImage(String? path) async {
    if (path == null || path.isEmpty) return;
    final file = File(path);
    if (await file.exists()) {
      await file.delete();
    }
  }
}

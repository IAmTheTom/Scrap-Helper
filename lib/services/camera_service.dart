part of '../main.dart';

class CameraService {
  CameraService({PhotoAttachmentService? photoService})
    : _photoService = photoService ?? PhotoAttachmentService();

  final PhotoAttachmentService _photoService;

  Future<void> attach(
    BuildContext context, {
    required ScrapprModel model,
    required VoidCallback changed,
    required String ownerId,
    required String ownerType,
    required String label,
  }) async {
    final action = await showModalBottomSheet<PhotoAttachmentAction>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Take photo'),
              onTap: () =>
                  Navigator.pop(sheetContext, PhotoAttachmentAction.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose existing photo'),
              onTap: () =>
                  Navigator.pop(sheetContext, PhotoAttachmentAction.gallery),
            ),
            if (_photoService
                .listForOwner(
                  model.photos,
                  ownerId: ownerId,
                  ownerType: ownerType,
                )
                .isNotEmpty)
              ListTile(
                leading: const Icon(Icons.list_alt_outlined),
                title: const Text('Manage attached photos'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showAttachedPhotos(
                    context,
                    model: model,
                    changed: changed,
                    ownerId: ownerId,
                    ownerType: ownerType,
                    label: label,
                  );
                },
              ),
          ],
        ),
      ),
    );
    if (action == null || !context.mounted) return;
    final (result, attachment) = await _photoService.attach(
      ownerId: ownerId,
      ownerType: ownerType,
      action: action,
      caption: '$label photo',
    );
    if (!context.mounted) return;
    switch (result) {
      case PhotoAttachmentResult.attached:
        model.photos.add(attachment!);
        changed();
        _message(context, 'Photo attached.');
        return;
      case PhotoAttachmentResult.cancelled:
        _message(context, 'Photo selection cancelled.');
        return;
      case PhotoAttachmentResult.unsupported:
        _message(
          context,
          'Camera capture failed or is unavailable on this device.',
        );
        return;
      case PhotoAttachmentResult.failed:
        _message(
          context,
          action == PhotoAttachmentAction.camera
              ? 'Camera capture failed or is unavailable on this device.'
              : 'Photo selection failed or is unavailable on this device.',
        );
        return;
    }
  }

  Future<void> _showAttachedPhotos(
    BuildContext context, {
    required ScrapprModel model,
    required VoidCallback changed,
    required String ownerId,
    required String ownerType,
    required String label,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          final photos = _photoService.listForOwner(
            model.photos,
            ownerId: ownerId,
            ownerType: ownerType,
          );
          return AlertDialog(
            title: Text('$label photos'),
            content: SizedBox(
              width: 520,
              child: photos.isEmpty
                  ? const Text('No attached photos.')
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        for (final photo in photos)
                          ListTile(
                            leading: const Icon(Icons.image_outlined),
                            title: Text(
                              photo.caption.isEmpty
                                  ? 'Attached photo'
                                  : photo.caption,
                            ),
                            subtitle: Text(photo.localPath ?? 'No local file'),
                            trailing: IconButton(
                              tooltip: 'Delete photo',
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () async {
                                await _photoService.delete(model.photos, photo);
                                changed();
                                setDialogState(() {});
                              },
                            ),
                          ),
                      ],
                    ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Close'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _message(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

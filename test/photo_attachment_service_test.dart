import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/database/app_database.dart';
import 'package:scrap_helper/main.dart';

class FakePhotoSourcePicker implements PhotoSourcePicker {
  FakePhotoSourcePicker({this.cameraPath, this.galleryPath});

  String? cameraPath;
  String? galleryPath;

  @override
  Future<String?> capturePhoto() async => cameraPath;

  @override
  Future<String?> choosePhoto() async => galleryPath;
}

void main() {
  test('photo metadata and app-controlled file persist and delete', () async {
    final directory = await Directory.systemTemp.createTemp('scrappr_photo_');
    final source = File('${directory.path}/source.jpg');
    await source.writeAsBytes([1, 2, 3, 4]);
    final storage = Directory('${directory.path}/storage');
    final databaseFile = File('${directory.path}/scrappr.sqlite');
    addTearDown(() async {
      if (directory.existsSync()) directory.deleteSync(recursive: true);
    });

    final picker = FakePhotoSourcePicker(galleryPath: source.path);
    final photoService = PhotoAttachmentService(
      picker: picker,
      storageDirectoryProvider: () async => storage,
      cameraSupported: false,
    );
    final (result, attachment) = await photoService.attach(
      ownerId: 'l1',
      ownerType: PhotoOwnerType.inboxItem,
      action: PhotoAttachmentAction.gallery,
      caption: 'Test attachment',
    );

    expect(result, PhotoAttachmentResult.attached);
    expect(attachment, isNotNull);
    expect(await File(attachment!.localPath!).exists(), isTrue);
    expect(
      photoService.listForOwner(
        [attachment],
        ownerId: 'l1',
        ownerType: PhotoOwnerType.inboxItem,
      ),
      hasLength(1),
    );

    var database = AppDatabase.forTesting(NativeDatabase(databaseFile));
    var persistence = PersistenceService(database);
    final model = await persistence.loadOrSeed();
    model.photos.add(attachment);
    photoService.updateCaption(
      model.photos,
      attachmentId: attachment.id,
      caption: 'Updated test attachment',
    );
    await persistence.save(model);
    await database.close();

    database = AppDatabase.forTesting(NativeDatabase(databaseFile));
    persistence = PersistenceService(database);
    var reloaded = await persistence.load();
    expect(reloaded.photos, hasLength(1));
    expect(reloaded.photos.single.ownerId, 'l1');
    expect(reloaded.photos.single.caption, 'Updated test attachment');
    expect(reloaded.photos.single.hash, isNull);
    expect(reloaded.photos.single.ocrText, isNull);

    final storedPath = reloaded.photos.single.localPath!;
    await photoService.delete(reloaded.photos, reloaded.photos.single);
    await persistence.save(reloaded);
    await database.close();
    expect(await File(storedPath).exists(), isFalse);

    database = AppDatabase.forTesting(NativeDatabase(databaseFile));
    persistence = PersistenceService(database);
    reloaded = await persistence.load();
    expect(reloaded.photos, isEmpty);
    await database.close();
  });

  test('camera reports unsupported without invoking hardware', () async {
    final directory = await Directory.systemTemp.createTemp('scrappr_photo_');
    addTearDown(() async {
      if (directory.existsSync()) directory.deleteSync(recursive: true);
    });
    final service = PhotoAttachmentService(
      picker: FakePhotoSourcePicker(),
      storageDirectoryProvider: () async => directory,
      cameraSupported: false,
    );

    final (result, attachment) = await service.attach(
      ownerId: 'item',
      ownerType: PhotoOwnerType.runItem,
      action: PhotoAttachmentAction.camera,
    );

    expect(result, PhotoAttachmentResult.unsupported);
    expect(attachment, isNull);
  });
}

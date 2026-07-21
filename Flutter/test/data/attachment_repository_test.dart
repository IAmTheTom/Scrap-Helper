import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/data/repositories/attachment_repository.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('copies and records attachment', () async {
    final temp = await Directory.systemTemp.createTemp('scrap_attachment_test');
    PathProviderPlatform.instance = _FakePathProvider(temp.path);

    final source = File('${temp.path}${Platform.pathSeparator}source.txt');
    await source.writeAsString('test');

    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
    final repository = AttachmentRepository(db);
    final record = await repository.add(
      entityType: 'RECEIPT',
      entityId: 1,
      sourcePath: source.path,
      mediaType: 'DOCUMENT',
    );

    expect(File(record.filePath).existsSync(), isTrue);
    expect(
      await repository.listFor(entityType: 'RECEIPT', entityId: 1),
      hasLength(1),
    );

    await db.close();
    await temp.delete(recursive: true);
  });
}

class _FakePathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _FakePathProvider(this.path);

  final String path;

  @override
  Future<String?> getApplicationDocumentsPath() async => path;
}

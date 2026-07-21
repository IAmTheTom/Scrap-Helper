import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/services/backup_service.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('validates generated backup structure', () async {
    final temp = await Directory.systemTemp.createTemp('scrap_helper_test');
    PathProviderPlatform.instance = _FakePathProvider(temp.path);

    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
    final service = BackupService(db);
    final file = await service.createBackup();
    final result = await service.validateFile(file.path);

    expect(result.isValid, isTrue);
    expect(
      (jsonDecode(await file.readAsString()) as Map)['backup_format_version'],
      1,
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

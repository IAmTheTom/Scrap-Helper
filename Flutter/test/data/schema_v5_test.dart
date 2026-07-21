import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('creates attachments table at schema five', () async {
    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );

    final tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type = 'table'",
    );
    expect(tables.map((row) => row['name']), contains('attachments'));

    final metadata = await db.query(
      'app_metadata',
      where: 'key = ?',
      whereArgs: const <Object?>['schema_version'],
    );
    expect(metadata.single['value'], '5');

    await db.close();
  });
}

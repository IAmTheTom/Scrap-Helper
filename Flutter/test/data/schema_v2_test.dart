import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('creates version two performance tables', () async {
    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );

    final tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type = 'table'",
    );
    final names = tables.map((row) => row['name']);

    expect(names, contains('load_costs'));
    expect(names, contains('load_item_outcomes'));

    final metadata = await db.query(
      'app_metadata',
      where: 'key = ?',
      whereArgs: const <Object?>['schema_version'],
    );
    expect(metadata.single['value'], '2');

    await db.close();
  });
}

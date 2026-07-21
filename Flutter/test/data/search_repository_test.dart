import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/data/repositories/search_repository.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('searches objects and categories', () async {
    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
    final now = '2026-07-21T00:00:00Z';

    await db.insert('object_templates', <String, Object?>{
      'name': 'Microwave',
      'subtype': '',
      'description': 'Kitchen appliance',
      'whole_weight_low_g': 1,
      'whole_weight_typical_g': 2,
      'whole_weight_high_g': 3,
      'weight_confidence': 'LOW',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
      'is_active': 1,
    });
    await db.insert('scrap_categories', <String, Object?>{
      'name': 'Transformers',
      'description': 'Copper-bearing component',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
      'is_active': 1,
    });

    final repository = SearchRepository(db);
    expect(await repository.search('micro'), hasLength(1));
    expect(await repository.search('transform'), hasLength(1));

    await db.close();
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';

void main() {
  late Database db;

  setUpAll(() {
    sqfliteFfiInit();
  });

  setUp(() async {
    db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('creates schema and metadata', () async {
    final tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type = 'table'",
    );
    expect(
      tables.map((row) => row['name']),
      containsAll(<String>[
        'app_metadata',
        'scrap_categories',
        'scrapyards',
        'yard_prices',
        'object_templates',
        'recoverable_components',
        'loads',
        'load_object_items',
        'load_material_items',
        'receipts',
        'receipt_lines',
        'estimate_snapshots',
        'load_calibration_observations',
      ]),
    );

    final metadata = await db.query('app_metadata');
    expect(metadata, contains(containsPair('key', 'schema_version')));
  });

  test('enables foreign keys', () async {
    final result = await db.rawQuery('PRAGMA foreign_keys');
    expect(result.single.values.single, 1);
  });

  test('rejects invalid category source type', () async {
    expect(
      () => db.insert('scrap_categories', <String, Object?>{
        'name': 'Invalid Category',
        'source_type': 'WRONG',
        'created_at': '2026-07-11T00:00:00Z',
        'updated_at': '2026-07-11T00:00:00Z',
      }),
      throwsA(isA<DatabaseException>()),
    );
  });

  test('enforces same-load linked material trigger', () async {
    final now = '2026-07-11T00:00:00Z';

    final categoryId = await db.insert('scrap_categories', <String, Object?>{
      'name': 'Shred Steel',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
    });

    final templateId = await db.insert('object_templates', <String, Object?>{
      'name': 'Microwave',
      'subtype': '',
      'whole_weight_low_g': 1000,
      'whole_weight_typical_g': 2000,
      'whole_weight_high_g': 3000,
      'weight_confidence': 'LOW',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
    });

    final loadA = await db.insert('loads', <String, Object?>{
      'date': '2026-07-11',
      'created_at': now,
      'updated_at': now,
    });
    final loadB = await db.insert('loads', <String, Object?>{
      'date': '2026-07-11',
      'created_at': now,
      'updated_at': now,
    });

    final objectItem = await db.insert('load_object_items', <String, Object?>{
      'load_id': loadA,
      'object_template_id': templateId,
      'quantity': 1,
      'recovery_level': 'STANDARD',
      'created_at': now,
      'updated_at': now,
    });

    expect(
      () => db.insert('load_material_items', <String, Object?>{
        'load_id': loadB,
        'category_id': categoryId,
        'measured_weight_g': 500,
        'linked_object_item_id': objectItem,
        'source_type': 'MEASURED',
        'created_at': now,
        'updated_at': now,
      }),
      throwsA(isA<DatabaseException>()),
    );
  });

  test('permits only one linked override per object and category', () async {
    final now = '2026-07-11T00:00:00Z';

    final categoryId = await db.insert('scrap_categories', <String, Object?>{
      'name': 'Transformers',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
    });

    final templateId = await db.insert('object_templates', <String, Object?>{
      'name': 'Microwave',
      'subtype': 'Test',
      'whole_weight_low_g': 1000,
      'whole_weight_typical_g': 2000,
      'whole_weight_high_g': 3000,
      'weight_confidence': 'LOW',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
    });

    final loadId = await db.insert('loads', <String, Object?>{
      'date': '2026-07-11',
      'created_at': now,
      'updated_at': now,
    });

    final objectItem = await db.insert('load_object_items', <String, Object?>{
      'load_id': loadId,
      'object_template_id': templateId,
      'quantity': 1,
      'recovery_level': 'STANDARD',
      'created_at': now,
      'updated_at': now,
    });

    Future<int> insertOverride(int weight) {
      return db.insert('load_material_items', <String, Object?>{
        'load_id': loadId,
        'category_id': categoryId,
        'measured_weight_g': weight,
        'linked_object_item_id': objectItem,
        'source_type': 'MEASURED',
        'created_at': now,
        'updated_at': now,
      });
    }

    await insertOverride(500);
    expect(() => insertOverride(600), throwsA(isA<DatabaseException>()));
  });
}

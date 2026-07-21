import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/data/models/performance_models.dart';
import 'package:scrap_helper/data/repositories/performance_repository.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('aggregates object performance', () async {
    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
    final now = '2026-07-21T00:00:00Z';

    final categoryId = await db.insert('scrap_categories', <String, Object?>{
      'name': 'Shred Steel',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
    });
    expect(categoryId, greaterThan(0));

    final yardId = await db.insert('scrapyards', <String, Object?>{
      'name': 'Test Yard',
      'source_type': 'MANUAL',
      'created_at': now,
      'updated_at': now,
    });
    final objectId = await db.insert('object_templates', <String, Object?>{
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
    final loadId = await db.insert('loads', <String, Object?>{
      'scrapyard_id': yardId,
      'date': '2026-07-21',
      'status': 'FINALIZED',
      'created_at': now,
      'updated_at': now,
    });
    final loadItemId = await db.insert('load_object_items', <String, Object?>{
      'load_id': loadId,
      'object_template_id': objectId,
      'quantity': 2,
      'recovery_level': 'STANDARD',
      'created_at': now,
      'updated_at': now,
      'is_active': 1,
    });

    final repository = PerformanceRepository(db);
    await repository.saveOutcome(
      LoadItemOutcomeDraft(
        loadObjectItemId: loadItemId,
        completedQuantity: 2,
        processingMinutes: 30,
        estimatedLikelyCents: 2400,
        allocatedActualPayoutCents: 3000,
        directCostCents: 200,
      ),
    );

    final performance = await repository.getObjectPerformance();
    expect(performance, hasLength(1));
    expect(performance.single.totalNetCents, 2800);
    expect(performance.single.averageNetPerItemCents, 1400);

    await db.close();
  });
}

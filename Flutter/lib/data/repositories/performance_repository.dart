import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/performance_models.dart';

final class PerformanceRepository {
  PerformanceRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<List<FinalizedLoadItem>> getFinalizedLoadItems(int loadId) async {
    final db = await _db;
    final rows = await db.rawQuery(
      '''
      SELECT
        loi.id,
        loi.object_template_id,
        ot.name AS object_name,
        loi.quantity,
        loi.recovery_level
      FROM load_object_items loi
      JOIN object_templates ot ON ot.id = loi.object_template_id
      WHERE loi.load_id = ? AND loi.is_active = 1
      ORDER BY loi.id
      ''',
      <Object?>[loadId],
    );
    return rows.map(FinalizedLoadItem.fromMap).toList();
  }

  Future<LoadCostRecord?> getLoadCosts(int loadId) async {
    final db = await _db;
    final rows = await db.query(
      'load_costs',
      where: 'load_id = ?',
      whereArgs: <Object?>[loadId],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    final row = rows.single;
    return LoadCostRecord(
      loadId: loadId,
      pickupMilesMilli: row['pickup_miles_milli'] as int,
      fuelCostCents: row['fuel_cost_cents'] as int,
      purchaseCostCents: row['purchase_cost_cents'] as int,
      disposalCostCents: row['disposal_cost_cents'] as int,
      tireRemovalCostCents: row['tire_removal_cost_cents'] as int,
      otherCostCents: row['other_cost_cents'] as int,
      notes: row['notes'] as String?,
    );
  }

  Future<void> saveLoadCosts(LoadCostRecord costs) async {
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    await db.insert('load_costs', <String, Object?>{
      'load_id': costs.loadId,
      'pickup_miles_milli': costs.pickupMilesMilli,
      'fuel_cost_cents': costs.fuelCostCents,
      'purchase_cost_cents': costs.purchaseCostCents,
      'disposal_cost_cents': costs.disposalCostCents,
      'tire_removal_cost_cents': costs.tireRemovalCostCents,
      'other_cost_cents': costs.otherCostCents,
      'notes': costs.notes,
      'created_at': now,
      'updated_at': now,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> saveOutcome(LoadItemOutcomeDraft outcome) async {
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    await db.insert('load_item_outcomes', <String, Object?>{
      'load_object_item_id': outcome.loadObjectItemId,
      'completed_quantity': outcome.completedQuantity,
      'processing_minutes': outcome.processingMinutes,
      'estimated_likely_cents': outcome.estimatedLikelyCents,
      'allocated_actual_payout_cents': outcome.allocatedActualPayoutCents,
      'direct_cost_cents': outcome.directCostCents,
      'notes': outcome.notes,
      'created_at': now,
      'updated_at': now,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ObjectPerformance>> getObjectPerformance() async {
    final db = await _db;
    final rows = await db.rawQuery('''
      SELECT
        ot.id AS object_template_id,
        ot.name AS object_name,
        COUNT(lio.id) AS sample_count,
        COALESCE(SUM(lio.completed_quantity), 0) AS total_quantity,
        COALESCE(SUM(lio.processing_minutes), 0) AS total_minutes,
        COALESCE(SUM(lio.estimated_likely_cents), 0)
          AS total_estimated_cents,
        COALESCE(SUM(lio.allocated_actual_payout_cents), 0)
          AS total_actual_cents,
        COALESCE(SUM(lio.direct_cost_cents), 0)
          AS total_direct_cost_cents
      FROM load_item_outcomes lio
      JOIN load_object_items loi ON loi.id = lio.load_object_item_id
      JOIN object_templates ot ON ot.id = loi.object_template_id
      GROUP BY ot.id, ot.name
      ORDER BY
        (COALESCE(SUM(lio.allocated_actual_payout_cents), 0) -
         COALESCE(SUM(lio.direct_cost_cents), 0)) DESC,
        ot.name COLLATE NOCASE
      ''');
    return rows.map(ObjectPerformance.fromMap).toList();
  }
}

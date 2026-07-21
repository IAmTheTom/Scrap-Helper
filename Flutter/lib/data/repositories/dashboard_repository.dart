import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/productivity_models.dart';

final class DashboardRepository {
  DashboardRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<DashboardSummary> load() async {
    final db = await _db;
    final now = DateTime.now();
    final monthStart =
        '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-01';

    final activeOpportunities = await _scalar(
      db,
      "SELECT COUNT(*) AS value FROM pickup_opportunities "
      "WHERE status IN ('SEEN','SCHEDULED')",
    );
    final storedItemCount = await _scalar(
      db,
      "SELECT COALESCE(SUM(quantity),0) AS value FROM storage_items "
      "WHERE status != 'REMOVED'",
    );
    final storedValueCents = await _scalar(
      db,
      "SELECT COALESCE(SUM(estimated_value_cents),0) AS value "
      "FROM storage_items WHERE status != 'REMOVED'",
    );
    final draftLoadItemCount = await _scalar(db, '''
      SELECT COALESCE(SUM(loi.quantity),0) AS value
      FROM load_object_items loi
      JOIN loads l ON l.id = loi.load_id
      WHERE l.status = 'DRAFT' AND loi.is_active = 1
      ''');
    final finalizedLoadCount = await _scalar(
      db,
      "SELECT COUNT(*) AS value FROM loads WHERE status = 'FINALIZED'",
    );
    final lifetimeActualCents = await _scalar(
      db,
      "SELECT COALESCE(SUM(total_paid_cents),0) AS value "
      "FROM receipts WHERE status = 'ACTIVE'",
    );
    final lifetimeCostCents = await _scalar(db, '''
      SELECT COALESCE(SUM(
        fuel_cost_cents + purchase_cost_cents + disposal_cost_cents +
        tire_removal_cost_cents + other_cost_cents
      ),0) AS value FROM load_costs
      ''');
    final monthActualCents = await _scalar(
      db,
      "SELECT COALESCE(SUM(total_paid_cents),0) AS value "
      "FROM receipts WHERE status = 'ACTIVE' AND date >= ?",
      <Object?>[monthStart],
    );
    final monthCostCents = await _scalar(
      db,
      '''
      SELECT COALESCE(SUM(
        lc.fuel_cost_cents + lc.purchase_cost_cents +
        lc.disposal_cost_cents + lc.tire_removal_cost_cents +
        lc.other_cost_cents
      ),0) AS value
      FROM load_costs lc
      JOIN loads l ON l.id = lc.load_id
      WHERE l.date >= ?
      ''',
      <Object?>[monthStart],
    );

    final topRows = await db.rawQuery('''
      SELECT
        ot.name,
        COALESCE(SUM(lio.allocated_actual_payout_cents),0) -
        COALESCE(SUM(lio.direct_cost_cents),0) AS net
      FROM load_item_outcomes lio
      JOIN load_object_items loi ON loi.id = lio.load_object_item_id
      JOIN object_templates ot ON ot.id = loi.object_template_id
      GROUP BY ot.id, ot.name
      ORDER BY net DESC
      LIMIT 1
      ''');

    return DashboardSummary(
      activeOpportunities: activeOpportunities,
      storedItemCount: storedItemCount,
      storedValueCents: storedValueCents,
      draftLoadItemCount: draftLoadItemCount,
      finalizedLoadCount: finalizedLoadCount,
      lifetimeActualCents: lifetimeActualCents,
      lifetimeCostCents: lifetimeCostCents,
      monthActualCents: monthActualCents,
      monthCostCents: monthCostCents,
      topRecommendation: topRows.isEmpty
          ? null
          : topRows.single['name'] as String?,
    );
  }

  Future<int> _scalar(
    Database db,
    String sql, [
    List<Object?>? arguments,
  ]) async {
    final rows = await db.rawQuery(sql, arguments);
    return (rows.single['value'] as int?) ?? 0;
  }
}

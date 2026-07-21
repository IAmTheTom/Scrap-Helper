import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/productivity_models.dart';

final class ReportRepository {
  ReportRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<PeriodReport> loadPeriod({
    required String label,
    String? startDate,
  }) async {
    final db = await _db;
    final filter = startDate == null ? '' : ' AND date >= ?';
    final args = startDate == null ? null : <Object?>[startDate];

    final receipts = await db.rawQuery('''
      SELECT
        COALESCE(SUM(total_paid_cents),0) AS gross,
        COUNT(*) AS count
      FROM receipts
      WHERE status = 'ACTIVE'$filter
      ''', args);

    final costs = await db.rawQuery('''
      SELECT
        COALESCE(SUM(
          lc.fuel_cost_cents + lc.purchase_cost_cents +
          lc.disposal_cost_cents + lc.tire_removal_cost_cents +
          lc.other_cost_cents
        ),0) AS costs,
        COALESCE(SUM(lc.pickup_miles_milli),0) AS miles
      FROM load_costs lc
      JOIN loads l ON l.id = lc.load_id
      WHERE 1 = 1${startDate == null ? '' : ' AND l.date >= ?'}
      ''', args);

    final outcomes = await db.rawQuery('''
      SELECT COALESCE(SUM(lio.processing_minutes),0) AS minutes
      FROM load_item_outcomes lio
      JOIN load_object_items loi ON loi.id = lio.load_object_item_id
      JOIN loads l ON l.id = loi.load_id
      WHERE 1 = 1${startDate == null ? '' : ' AND l.date >= ?'}
      ''', args);

    final loads = await db.rawQuery('''
      SELECT
        COUNT(*) AS count,
        COALESCE(SUM(es.payout_likely_cents),0) AS estimate
      FROM loads l
      LEFT JOIN estimate_snapshots es ON es.load_id = l.id
      WHERE l.status = 'FINALIZED'
      ${startDate == null ? '' : ' AND l.date >= ?'}
      ''', args);

    return PeriodReport(
      label: label,
      grossCents: receipts.single['gross'] as int,
      costCents: costs.single['costs'] as int,
      processingMinutes: outcomes.single['minutes'] as int,
      pickupMilesMilli: costs.single['miles'] as int,
      loadCount: loads.single['count'] as int,
      receiptCount: receipts.single['count'] as int,
      estimatedLikelyCents: loads.single['estimate'] as int,
    );
  }

  Future<List<PeriodReport>> loadStandardPeriods() async {
    final now = DateTime.now();
    String date(DateTime value) =>
        '${value.year.toString().padLeft(4, '0')}-'
        '${value.month.toString().padLeft(2, '0')}-'
        '${value.day.toString().padLeft(2, '0')}';

    final today = date(now);
    final week = date(now.subtract(const Duration(days: 7)));
    final month =
        '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-01';
    final year = '${now.year.toString().padLeft(4, '0')}-01-01';

    return <PeriodReport>[
      await loadPeriod(label: 'Today', startDate: today),
      await loadPeriod(label: 'Last 7 Days', startDate: week),
      await loadPeriod(label: 'This Month', startDate: month),
      await loadPeriod(label: 'This Year', startDate: year),
      await loadPeriod(label: 'Lifetime'),
    ];
  }
}

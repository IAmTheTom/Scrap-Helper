import 'package:sqflite/sqflite.dart';

import '../../domain/enums/app_enums.dart';
import '../database/app_database.dart';
import '../models/history_models.dart';

final class HistoryRepository {
  HistoryRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<List<FinalizedLoadSummary>> getFinalizedLoads() async {
    final db = await _db;
    final rows = await db.rawQuery('''
      SELECT
        l.id AS load_id,
        l.scrapyard_id,
        l.date,
        COUNT(DISTINCT loi.id) AS item_count,
        es.payout_low_cents,
        es.payout_likely_cents,
        es.payout_high_cents,
        COALESCE(SUM(
          CASE WHEN r.status = 'ACTIVE' THEN r.total_paid_cents ELSE 0 END
        ), 0) AS actual_paid_cents,
        COUNT(DISTINCT CASE WHEN r.status = 'ACTIVE' THEN r.id END)
          AS receipt_count
      FROM loads l
      JOIN estimate_snapshots es ON es.load_id = l.id
      LEFT JOIN load_object_items loi
        ON loi.load_id = l.id AND loi.is_active = 1
      LEFT JOIN receipts r ON r.load_id = l.id
      WHERE l.status = 'FINALIZED'
      GROUP BY l.id, es.id
      ORDER BY l.date DESC, l.id DESC
      ''');
    return rows.map(FinalizedLoadSummary.fromMap).toList();
  }

  Future<int> saveReceipt({
    required int loadId,
    required int scrapyardId,
    required String date,
    required List<ReceiptLineDraft> lines,
    int receiptLevelAdjustmentCents = 0,
    String? notes,
  }) async {
    if (lines.isEmpty) {
      throw ArgumentError('At least one receipt line is required.');
    }

    final db = await _db;
    final lineTotal = lines.fold<int>(
      0,
      (sum, line) => sum + line.linePayoutCents + line.lineAdjustmentCents,
    );
    final total = lineTotal + receiptLevelAdjustmentCents;
    if (total < 0) {
      throw ArgumentError('Receipt total cannot be negative.');
    }

    return db.transaction((txn) async {
      final now = DateTime.now().toUtc().toIso8601String();
      final receiptId = await txn.insert('receipts', <String, Object?>{
        'load_id': loadId,
        'scrapyard_id': scrapyardId,
        'date': date,
        'total_paid_cents': total,
        'receipt_level_adjustment_cents': receiptLevelAdjustmentCents,
        'status': ReceiptStatus.active.dbValue,
        'source_type': SourceType.receipt.dbValue,
        'source_notes': notes,
        'created_at': now,
        'updated_at': now,
      });

      for (final line in lines) {
        await txn.insert('receipt_lines', <String, Object?>{
          'receipt_id': receiptId,
          'category_id': line.categoryId,
          'yard_category_name': line.yardCategoryName,
          'weight_g': line.weightG,
          'source_weight_value': line.sourceWeightValue,
          'source_weight_unit': line.sourceWeightUnit,
          'rate_units': line.rateUnits,
          'rate_unit': line.rateUnit,
          'line_payout_cents': line.linePayoutCents,
          'line_adjustment_cents': line.lineAdjustmentCents,
          'notes': line.notes,
          'created_at': now,
          'updated_at': now,
        });
      }

      return receiptId;
    });
  }

  Future<void> voidReceipt({
    required int receiptId,
    required String reason,
  }) async {
    if (reason.trim().isEmpty) {
      throw ArgumentError('A void reason is required.');
    }
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    await db.update(
      'receipts',
      <String, Object?>{
        'status': ReceiptStatus.voided.dbValue,
        'void_reason': reason.trim(),
        'voided_at': now,
        'updated_at': now,
      },
      where: 'id = ? AND status = ?',
      whereArgs: <Object?>[receiptId, ReceiptStatus.active.dbValue],
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/data/models/history_models.dart';
import 'package:scrap_helper/data/repositories/history_repository.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('saves receipt header and lines atomically', () async {
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
    final yardId = await db.insert('scrapyards', <String, Object?>{
      'name': 'Test Yard',
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

    final repository = HistoryRepository(db);
    final receiptId = await repository.saveReceipt(
      loadId: loadId,
      scrapyardId: yardId,
      date: '2026-07-21',
      lines: <ReceiptLineDraft>[
        ReceiptLineDraft(
          categoryId: categoryId,
          yardCategoryName: 'Shred Steel',
          weightG: 4536,
          sourceWeightValue: '10',
          sourceWeightUnit: 'POUND',
          rateUnits: 1000,
          rateUnit: 'PER_POUND',
          linePayoutCents: 100,
        ),
      ],
    );

    final receiptRows = await db.query(
      'receipts',
      where: 'id = ?',
      whereArgs: <Object?>[receiptId],
    );
    final lineRows = await db.query(
      'receipt_lines',
      where: 'receipt_id = ?',
      whereArgs: <Object?>[receiptId],
    );

    expect(receiptRows.single['total_paid_cents'], 100);
    expect(lineRows, hasLength(1));
    await db.close();
  });
}

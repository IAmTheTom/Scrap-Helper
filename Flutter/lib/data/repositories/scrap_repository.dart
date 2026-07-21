import 'package:sqflite/sqflite.dart';

import '../../domain/enums/app_enums.dart';
import '../database/app_database.dart';
import '../models/load_models.dart';
import '../models/reference_models.dart';

final class ScrapRepository {
  Future<Database> get _db => AppDatabase.instance;

  Future<List<ScrapCategory>> getCategories() async {
    final db = await _db;
    final rows = await db.query(
      'scrap_categories',
      where: 'is_active = 1',
      orderBy: 'name COLLATE NOCASE',
    );
    return rows.map(ScrapCategory.fromMap).toList();
  }

  Future<List<Scrapyard>> getScrapyards() async {
    final db = await _db;
    final rows = await db.query(
      'scrapyards',
      where: 'is_active = 1',
      orderBy: 'name COLLATE NOCASE',
    );
    return rows.map(Scrapyard.fromMap).toList();
  }

  Future<List<ObjectTemplate>> getObjects({String search = ''}) async {
    final db = await _db;
    final rows = await db.query(
      'object_templates',
      where: search.trim().isEmpty
          ? 'is_active = 1'
          : 'is_active = 1 AND (name LIKE ? OR subtype LIKE ?)',
      whereArgs: search.trim().isEmpty
          ? null
          : <Object?>['%${search.trim()}%', '%${search.trim()}%'],
      orderBy: 'name COLLATE NOCASE, subtype COLLATE NOCASE',
    );
    return rows.map(ObjectTemplate.fromMap).toList();
  }

  Future<ObjectTemplate> getObject(int id) async {
    final db = await _db;
    final rows = await db.query(
      'object_templates',
      where: 'id = ?',
      whereArgs: <Object?>[id],
      limit: 1,
    );
    if (rows.isEmpty) throw StateError('Object template not found: $id');
    return ObjectTemplate.fromMap(rows.single);
  }

  Future<List<RecoverableComponent>> getComponents(int objectId) async {
    final db = await _db;
    final rows = await db.query(
      'recoverable_components',
      where: 'object_template_id = ? AND is_active = 1',
      whereArgs: <Object?>[objectId],
      orderBy: 'recovery_level, sort_order, component_name',
    );
    return rows.map(RecoverableComponent.fromMap).toList();
  }

  Future<List<YardPrice>> getCurrentPrices(int scrapyardId) async {
    final db = await _db;
    final rows = await db.rawQuery(
      '''
      SELECT yp.*
      FROM yard_prices yp
      INNER JOIN (
        SELECT category_id, MAX(effective_from) AS max_effective
        FROM yard_prices
        WHERE scrapyard_id = ? AND is_active = 1
        GROUP BY category_id
      ) latest
        ON latest.category_id = yp.category_id
       AND latest.max_effective = yp.effective_from
      WHERE yp.scrapyard_id = ? AND yp.is_active = 1
      ORDER BY yp.yard_category_name COLLATE NOCASE
      ''',
      <Object?>[scrapyardId, scrapyardId],
    );
    return rows.map(YardPrice.fromMap).toList();
  }

  Future<void> setPerPoundPrice({
    required int scrapyardId,
    required int categoryId,
    required String yardCategoryName,
    required int rateUnits,
  }) async {
    final db = await _db;
    final now = DateTime.now().toUtc();
    final timestamp = now.toIso8601String();
    final date = timestamp.substring(0, 10);

    await db.insert('yard_prices', <String, Object?>{
      'scrapyard_id': scrapyardId,
      'category_id': categoryId,
      'yard_category_name': yardCategoryName,
      'rate_units': rateUnits,
      'rate_unit': PriceUnit.perPound.dbValue,
      'fee_scope': FeeScope.none.dbValue,
      'fee_amount_cents': 0,
      'fee_rate_units': 0,
      'effective_from': date,
      'source_type': SourceType.manual.dbValue,
      'source_notes': 'Entered in Scrap Helper',
      'created_at': timestamp,
      'updated_at': timestamp,
      'is_active': 1,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<LoadRecord> getOrCreateDraftLoad(int scrapyardId) async {
    final db = await _db;
    final existing = await db.query(
      'loads',
      where: 'status = ?',
      whereArgs: <Object?>[LoadStatus.draft.dbValue],
      orderBy: 'id DESC',
      limit: 1,
    );
    if (existing.isNotEmpty) return LoadRecord.fromMap(existing.single);

    final now = DateTime.now().toUtc();
    final timestamp = now.toIso8601String();
    final id = await db.insert('loads', <String, Object?>{
      'scrapyard_id': scrapyardId,
      'date': timestamp.substring(0, 10),
      'status': LoadStatus.draft.dbValue,
      'created_at': timestamp,
      'updated_at': timestamp,
    });
    return LoadRecord(
      id: id,
      scrapyardId: scrapyardId,
      date: timestamp.substring(0, 10),
      status: LoadStatus.draft,
    );
  }

  Future<List<LoadObjectItem>> getLoadItems(int loadId) async {
    final db = await _db;
    final rows = await db.rawQuery(
      '''
      SELECT loi.*, ot.name AS object_name
      FROM load_object_items loi
      JOIN object_templates ot ON ot.id = loi.object_template_id
      WHERE loi.load_id = ? AND loi.is_active = 1
      ORDER BY loi.id DESC
      ''',
      <Object?>[loadId],
    );
    return rows.map(LoadObjectItem.fromMap).toList();
  }

  Future<void> addObjectToLoad({
    required int loadId,
    required int objectTemplateId,
    required RecoveryLevel recoveryLevel,
    int quantity = 1,
  }) async {
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    await db.insert('load_object_items', <String, Object?>{
      'load_id': loadId,
      'object_template_id': objectTemplateId,
      'quantity': quantity,
      'recovery_level': recoveryLevel.dbValue,
      'created_at': now,
      'updated_at': now,
      'is_active': 1,
    });
  }

  Future<void> changeLoadItem({
    required int itemId,
    int? quantity,
    RecoveryLevel? recoveryLevel,
  }) async {
    final db = await _db;

    final values = <String, Object?>{
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    };

    if (quantity != null) {
      values['quantity'] = quantity;
    }

    if (recoveryLevel != null) {
      values['recovery_level'] = recoveryLevel.dbValue;
    }

    await db.update(
      'load_object_items',
      values,
      where: 'id = ?',
      whereArgs: [itemId],
    );
  }

  Future<void> removeLoadItem(int itemId) async {
    final db = await _db;
    await db.update(
      'load_object_items',
      <String, Object?>{
        'is_active': 0,
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: <Object?>[itemId],
    );
  }
}

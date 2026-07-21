import 'dart:convert';

import 'package:sqflite/sqflite.dart';

import '../../data/database/app_database.dart';
import '../../data/models/load_models.dart';
import '../../data/models/reference_models.dart';
import '../calculation/load_estimator.dart';
import '../enums/app_enums.dart';

final class LoadFinalizationResult {
  const LoadFinalizationResult({
    required this.loadId,
    required this.lowCents,
    required this.likelyCents,
    required this.highCents,
  });

  final int loadId;
  final int lowCents;
  final int likelyCents;
  final int highCents;
}

final class LoadFinalizationService {
  Future<Database> get _db => AppDatabase.instance;

  Future<int?> findDraftLoadId() async {
    final db = await _db;
    final rows = await db.query(
      'loads',
      columns: const <String>['id'],
      where: 'status = ?',
      whereArgs: <Object?>[LoadStatus.draft.dbValue],
      orderBy: 'id DESC',
      limit: 1,
    );
    return rows.isEmpty ? null : rows.single['id'] as int;
  }

  Future<int> countActiveItems(int loadId) async {
    final db = await _db;
    final result = await db.rawQuery(
      '''
      SELECT COALESCE(SUM(quantity), 0) AS count
      FROM load_object_items
      WHERE load_id = ? AND is_active = 1
      ''',
      <Object?>[loadId],
    );
    return result.single['count'] as int;
  }

  Future<LoadFinalizationResult> finalize(int loadId) async {
    final db = await _db;
    return db.transaction((txn) async {
      final loadRows = await txn.query(
        'loads',
        where: 'id = ? AND status = ?',
        whereArgs: <Object?>[loadId, LoadStatus.draft.dbValue],
        limit: 1,
      );
      if (loadRows.isEmpty) {
        throw StateError('Load is not an editable draft.');
      }
      final load = loadRows.single;
      final scrapyardId = load['scrapyard_id'] as int?;

      final itemRows = await txn.rawQuery(
        '''
        SELECT loi.*, ot.name AS object_name
        FROM load_object_items loi
        JOIN object_templates ot ON ot.id = loi.object_template_id
        WHERE loi.load_id = ? AND loi.is_active = 1
        ORDER BY loi.id
        ''',
        <Object?>[loadId],
      );
      if (itemRows.isEmpty) {
        throw StateError('Cannot finalize an empty load.');
      }
      final items = itemRows.map(LoadObjectItem.fromMap).toList();

      final componentsByObject = <int, List<RecoverableComponent>>{};
      for (final item in items) {
        if (componentsByObject.containsKey(item.objectTemplateId)) continue;
        final rows = await txn.query(
          'recoverable_components',
          where: 'object_template_id = ? AND is_active = 1',
          whereArgs: <Object?>[item.objectTemplateId],
          orderBy: 'sort_order, id',
        );
        componentsByObject[item.objectTemplateId] = rows
            .map(RecoverableComponent.fromMap)
            .toList();
      }

      final priceRows = scrapyardId == null
          ? const <Map<String, Object?>>[]
          : await txn.rawQuery(
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
              ''',
              <Object?>[scrapyardId, scrapyardId],
            );
      final prices = priceRows.map(YardPrice.fromMap).toList();

      final estimate = LoadEstimator.calculate(
        items: items,
        componentsByObject: componentsByObject,
        prices: prices,
      );

      final now = DateTime.now().toUtc().toIso8601String();
      await txn.insert('estimate_snapshots', <String, Object?>{
        'load_id': loadId,
        'snapshot_version': '1.0',
        'calculation_schema': 'scrap_helper_calc_v1',
        'scrapyard_id': scrapyardId,
        'rates_json': jsonEncode(<String, Object?>{
          'schema_version': '1',
          'rates': prices
              .map(
                (price) => <String, Object?>{
                  'category_id': price.categoryId,
                  'rate_units': price.rateUnits,
                  'rate_unit': price.rateUnit.dbValue,
                },
              )
              .toList(),
        }),
        'yields_json': jsonEncode(<String, Object?>{
          'schema_version': '1',
          'objects': [
            for (final item in items)
              <String, Object?>{
                'object_item_id': item.id,
                'object_template_id': item.objectTemplateId,
                'quantity': item.quantity,
                'recovery_level': item.recoveryLevel.dbValue,
                'components':
                    (componentsByObject[item.objectTemplateId] ?? const [])
                        .where(
                          (component) =>
                              component.recoveryLevel == item.recoveryLevel,
                        )
                        .map(
                          (component) => <String, Object?>{
                            'category_id': component.categoryId,
                            'component_name': component.componentName,
                            'low_weight_g': component.lowWeightG,
                            'typical_weight_g': component.typicalWeightG,
                            'high_weight_g': component.highWeightG,
                          },
                        )
                        .toList(),
              },
          ],
        }),
        'recovery_levels_json': jsonEncode(<String, Object?>{
          'schema_version': '1',
          'recovery_levels': [
            for (final item in items)
              <String, Object?>{
                'object_item_id': item.id,
                'recovery_level': item.recoveryLevel.dbValue,
              },
          ],
        }),
        'estimated_category_weights_json': jsonEncode(<String, Object?>{
          'schema_version': '1',
          'category_weights': estimate.categoryEstimates
              .map(
                (category) => <String, Object?>{
                  'category_id': category.categoryId,
                  'low_weight_g': category.lowWeightG,
                  'typical_weight_g': category.typicalWeightG,
                  'high_weight_g': category.highWeightG,
                },
              )
              .toList(),
        }),
        'payout_low_cents': estimate.lowPayoutCents,
        'payout_likely_cents': estimate.typicalPayoutCents,
        'payout_high_cents': estimate.highPayoutCents,
        'created_at': now,
      });

      final changed = await txn.update(
        'loads',
        <String, Object?>{
          'status': LoadStatus.finalized.dbValue,
          'updated_at': now,
        },
        where: 'id = ? AND status = ?',
        whereArgs: <Object?>[loadId, LoadStatus.draft.dbValue],
      );
      if (changed != 1) {
        throw StateError('Load finalization lost its draft lock.');
      }

      return LoadFinalizationResult(
        loadId: loadId,
        lowCents: estimate.lowPayoutCents,
        likelyCents: estimate.typicalPayoutCents,
        highCents: estimate.highPayoutCents,
      );
    });
  }
}

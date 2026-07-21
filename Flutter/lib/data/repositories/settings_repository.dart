import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/productivity_models.dart';

final class SettingsRepository {
  SettingsRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<AppPreferences> load() async {
    final db = await _db;
    final rows = await db.query('app_settings');
    final values = <String, String>{
      for (final row in rows) row['key'] as String: row['value'] as String,
    };

    return AppPreferences(
      weightDisplaySystem: values['weight_display_system'] ?? 'US_CUSTOMARY',
      themeMode: values['theme_mode'] ?? 'SYSTEM',
      travelCostCentsPerMile:
          int.tryParse(values['travel_cost_cents_per_mile'] ?? '30') ?? 30,
      defaultRecoveryLevel: values['default_recovery_level'] ?? 'STANDARD',
      currencyCode: values['currency_code'] ?? 'USD',
    );
  }

  Future<void> save(AppPreferences preferences) async {
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    final values = <String, String>{
      'weight_display_system': preferences.weightDisplaySystem,
      'theme_mode': preferences.themeMode,
      'travel_cost_cents_per_mile': preferences.travelCostCentsPerMile
          .toString(),
      'default_recovery_level': preferences.defaultRecoveryLevel,
      'currency_code': preferences.currencyCode,
    };

    await db.transaction((txn) async {
      for (final entry in values.entries) {
        await txn.insert('app_settings', <String, Object?>{
          'key': entry.key,
          'value': entry.value,
          'updated_at': now,
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    });
  }
}

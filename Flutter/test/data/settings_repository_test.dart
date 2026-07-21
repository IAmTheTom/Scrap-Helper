import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/data/models/productivity_models.dart';
import 'package:scrap_helper/data/repositories/settings_repository.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('loads and saves preferences', () async {
    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
    final repository = SettingsRepository(db);

    final initial = await repository.load();
    expect(initial.weightDisplaySystem, 'US_CUSTOMARY');

    await repository.save(
      const AppPreferences(
        weightDisplaySystem: 'METRIC',
        themeMode: 'DARK',
        travelCostCentsPerMile: 42,
        defaultRecoveryLevel: 'QUICK',
        currencyCode: 'USD',
      ),
    );

    final changed = await repository.load();
    expect(changed.weightDisplaySystem, 'METRIC');
    expect(changed.travelCostCentsPerMile, 42);

    await db.close();
  });
}

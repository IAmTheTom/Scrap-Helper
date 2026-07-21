import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:scrap_helper/data/database/app_database.dart';
import 'package:scrap_helper/data/models/storage_models.dart';
import 'package:scrap_helper/data/repositories/storage_repository.dart';

void main() {
  setUpAll(sqfliteFfiInit);

  test('summarizes stored items by location', () async {
    final db = await AppDatabase.openAtPath(
      inMemoryDatabasePath,
      factory: databaseFactoryFfi,
    );
    final repository = StorageRepository(db);

    final locationId = await repository.saveLocation(
      const StorageLocation(name: 'Garage', capacityScore: 4),
    );

    await repository.saveItem(
      StorageItem(
        storageLocationId: locationId,
        label: 'Microwave',
        quantity: 2,
        estimatedValueCents: 3000,
        estimatedProcessingMinutes: 40,
        priority: 4,
        status: 'WAITING',
        acquiredAt: '2026-07-21',
      ),
    );

    final summaries = await repository.getSummaries();
    expect(summaries, hasLength(1));
    expect(summaries.single.waitingCount, 2);
    expect(summaries.single.estimatedValueCents, 3000);

    await db.close();
  });
}

import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/storage_models.dart';

final class StorageRepository {
  StorageRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<List<StorageLocation>> getLocations() async {
    final db = await _db;
    final rows = await db.query(
      'storage_locations',
      where: 'is_active = 1',
      orderBy: 'name COLLATE NOCASE',
    );
    return rows.map(StorageLocation.fromMap).toList();
  }

  Future<int> saveLocation(StorageLocation location) async {
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    final values = <String, Object?>{
      'name': location.name,
      'description': location.description,
      'capacity_score': location.capacityScore,
      'is_active': location.isActive ? 1 : 0,
      'updated_at': now,
    };

    if (location.id == null) {
      values['created_at'] = now;
      return db.insert('storage_locations', values);
    }

    await db.update(
      'storage_locations',
      values,
      where: 'id = ?',
      whereArgs: <Object?>[location.id],
    );
    return location.id!;
  }

  Future<List<StorageItem>> getItems({int? locationId}) async {
    final db = await _db;
    final rows = await db.query(
      'storage_items',
      where: locationId == null
          ? "status != 'REMOVED'"
          : "storage_location_id = ? AND status != 'REMOVED'",
      whereArgs: locationId == null ? null : <Object?>[locationId],
      orderBy: 'priority DESC, acquired_at, label COLLATE NOCASE',
    );
    return rows.map(StorageItem.fromMap).toList();
  }

  Future<int> saveItem(StorageItem item) async {
    final db = await _db;
    final now = DateTime.now().toUtc().toIso8601String();
    final values = <String, Object?>{
      'storage_location_id': item.storageLocationId,
      'object_template_id': item.objectTemplateId,
      'label': item.label,
      'quantity': item.quantity,
      'estimated_value_cents': item.estimatedValueCents,
      'estimated_processing_minutes': item.estimatedProcessingMinutes,
      'priority': item.priority,
      'status': item.status,
      'acquired_at': item.acquiredAt,
      'notes': item.notes,
      'updated_at': now,
    };

    if (item.id == null) {
      values['created_at'] = now;
      return db.insert('storage_items', values);
    }

    await db.update(
      'storage_items',
      values,
      where: 'id = ?',
      whereArgs: <Object?>[item.id],
    );
    return item.id!;
  }

  Future<List<StorageSummary>> getSummaries() async {
    final locations = await getLocations();
    final items = await getItems();
    return locations.map((location) {
      final matching = items.where(
        (item) => item.storageLocationId == location.id,
      );
      return StorageSummary(
        location: location,
        waitingCount: matching.fold<int>(0, (sum, item) => sum + item.quantity),
        estimatedValueCents: matching.fold<int>(
          0,
          (sum, item) => sum + item.estimatedValueCents,
        ),
        processingMinutes: matching.fold<int>(
          0,
          (sum, item) => sum + item.estimatedProcessingMinutes,
        ),
      );
    }).toList();
  }
}

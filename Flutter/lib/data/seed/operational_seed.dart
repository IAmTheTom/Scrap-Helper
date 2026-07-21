import '../database/app_database.dart';

abstract final class OperationalSeed {
  static Future<void> apply() async {
    final db = await AppDatabase.instance;
    final existing = await db.query(
      'storage_locations',
      columns: const <String>['id'],
      limit: 1,
    );
    if (existing.isNotEmpty) return;

    final now = DateTime.now().toUtc().toIso8601String();
    for (final location in const <Map<String, Object?>>[
      <String, Object?>{
        'name': 'Garage',
        'description': 'Primary waiting-to-process area.',
        'capacity_score': 4,
      },
      <String, Object?>{
        'name': 'Trailer',
        'description': 'Items currently staged for transport.',
        'capacity_score': 3,
      },
      <String, Object?>{
        'name': 'Sorted Bins',
        'description': 'Recovered material ready for a yard run.',
        'capacity_score': 2,
      },
    ]) {
      await db.insert('storage_locations', <String, Object?>{
        ...location,
        'is_active': 1,
        'created_at': now,
        'updated_at': now,
      });
    }
  }
}

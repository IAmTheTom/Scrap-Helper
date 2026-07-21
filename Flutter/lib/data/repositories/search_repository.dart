import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/productivity_models.dart';

final class SearchRepository {
  SearchRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<List<SearchResult>> search(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return const <SearchResult>[];

    final db = await _db;
    final pattern = '%$trimmed%';
    final rows = await db.rawQuery(
      '''
      SELECT 'OBJECT' AS kind, id, name AS title,
             COALESCE(description, subtype, '') AS subtitle
      FROM object_templates
      WHERE is_active = 1 AND (name LIKE ? OR subtype LIKE ? OR description LIKE ?)

      UNION ALL

      SELECT 'CATEGORY' AS kind, id, name AS title,
             COALESCE(description, '') AS subtitle
      FROM scrap_categories
      WHERE is_active = 1 AND (name LIKE ? OR description LIKE ?)

      UNION ALL

      SELECT 'OPPORTUNITY' AS kind, id, title,
             COALESCE(location_text, source_type, '') AS subtitle
      FROM pickup_opportunities
      WHERE title LIKE ? OR location_text LIKE ? OR notes LIKE ?

      UNION ALL

      SELECT 'STORAGE' AS kind, id, label AS title,
             status || ' • Qty ' || quantity AS subtitle
      FROM storage_items
      WHERE status != 'REMOVED' AND (label LIKE ? OR notes LIKE ?)

      UNION ALL

      SELECT 'LOAD' AS kind, id, 'Load #' || id AS title,
             date || ' • ' || status AS subtitle
      FROM loads
      WHERE CAST(id AS TEXT) LIKE ? OR date LIKE ? OR notes LIKE ?

      ORDER BY kind, title COLLATE NOCASE
      LIMIT 100
      ''',
      <Object?>[
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
        pattern,
      ],
    );

    return rows
        .map(
          (row) => SearchResult(
            kind: row['kind'] as String,
            title: row['title'] as String,
            subtitle: row['subtitle'] as String,
            referenceId: row['id'] as int,
          ),
        )
        .toList();
  }
}

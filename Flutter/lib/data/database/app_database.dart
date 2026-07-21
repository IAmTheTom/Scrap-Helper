import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../config/app_config.dart';
import 'schema_v1.dart';
import 'schema_v2.dart';

final class AppDatabase {
  AppDatabase._();

  static Database? _instance;

  static Future<Database> get instance async {
    final existing = _instance;
    if (existing != null) return existing;

    final documents = await getApplicationDocumentsDirectory();
    final path = p.join(documents.path, 'scrap_helper.db');
    final opened = await openAtPath(path);
    _instance = opened;
    return opened;
  }

  static Future<Database> openAtPath(
    String path, {
    DatabaseFactory? factory,
  }) async {
    final selectedFactory = factory ?? databaseFactory;
    return selectedFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: AppConfig.schemaVersion,
        onConfigure: (db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (db, version) async {
          await _createV1(db);
          if (version >= SchemaV2.version) {
            await _applyV2(db);
          }
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < SchemaV2.version && newVersion >= SchemaV2.version) {
            await _applyV2(db);
          }
        },
      ),
    );
  }

  static Future<void> _createV1(Database db) async {
    await db.transaction((txn) async {
      for (final statement in SchemaV1.statements) {
        await txn.execute(statement);
      }

      final now = DateTime.now().toUtc().toIso8601String();
      await txn.insert('app_metadata', <String, Object?>{
        'key': 'schema_version',
        'value': SchemaV1.version.toString(),
        'updated_at': now,
      });
      await txn.insert('app_metadata', <String, Object?>{
        'key': 'seed_version',
        'value': 'none',
        'updated_at': now,
      });
    });
  }

  static Future<void> _applyV2(Database db) async {
    await db.transaction((txn) async {
      for (final statement in SchemaV2.statements) {
        await txn.execute(statement);
      }

      await txn.insert('app_metadata', <String, Object?>{
        'key': 'schema_version',
        'value': SchemaV2.version.toString(),
        'updated_at': DateTime.now().toUtc().toIso8601String(),
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  static Future<void> close() async {
    final db = _instance;
    _instance = null;
    if (db != null) await db.close();
  }
}

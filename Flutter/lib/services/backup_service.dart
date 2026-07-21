import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../config/app_config.dart';
import '../data/database/app_database.dart';

final class BackupValidationResult {
  const BackupValidationResult({
    required this.isValid,
    required this.message,
    required this.tableCount,
  });

  final bool isValid;
  final String message;
  final int tableCount;
}

final class BackupService {
  BackupService([this._database]);

  final Database? _database;

  static const _tables = <String>[
    'app_metadata',
    'app_settings',
    'scrap_categories',
    'scrapyards',
    'yard_prices',
    'object_templates',
    'recoverable_components',
    'loads',
    'load_object_items',
    'load_material_items',
    'estimate_snapshots',
    'receipts',
    'receipt_lines',
    'load_costs',
    'load_item_outcomes',
    'pickup_opportunities',
    'storage_locations',
    'storage_items',
    'attachments',
  ];

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<File> createBackup() async {
    final db = await _db;
    final documents = await getApplicationDocumentsDirectory();
    final directory = Directory(p.join(documents.path, 'Backups'));
    await directory.create(recursive: true);

    final data = <String, Object?>{
      'backup_format_version': AppConfig.backupFormatVersion,
      'app_version': AppConfig.appVersion,
      'created_at': DateTime.now().toUtc().toIso8601String(),
      'tables': <String, Object?>{},
    };
    final tables = data['tables']! as Map<String, Object?>;
    for (final table in _tables) {
      tables[table] = await db.query(table);
    }

    final now = DateTime.now().toUtc();
    final stamp =
        '${now.year}${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}_'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';
    final file = File(
      p.join(directory.path, 'scrap_helper_$stamp.backup.json'),
    );
    await file.writeAsString(const JsonEncoder.withIndent('  ').convert(data));
    return file;
  }

  Future<BackupValidationResult> validateFile(String path) async {
    try {
      final file = File(path);
      if (!await file.exists()) {
        return const BackupValidationResult(
          isValid: false,
          message: 'Backup file does not exist.',
          tableCount: 0,
        );
      }

      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! Map<String, Object?>) {
        return const BackupValidationResult(
          isValid: false,
          message: 'Backup root is not a JSON object.',
          tableCount: 0,
        );
      }

      final version = decoded['backup_format_version'];
      final tables = decoded['tables'];
      if (version != AppConfig.backupFormatVersion ||
          tables is! Map<String, Object?>) {
        return const BackupValidationResult(
          isValid: false,
          message: 'Unsupported or malformed backup format.',
          tableCount: 0,
        );
      }

      final missing = _tables.where((table) => !tables.containsKey(table));
      if (missing.isNotEmpty) {
        return BackupValidationResult(
          isValid: false,
          message: 'Backup is missing tables: ${missing.join(', ')}',
          tableCount: tables.length,
        );
      }

      return BackupValidationResult(
        isValid: true,
        message: 'Backup structure is valid.',
        tableCount: tables.length,
      );
    } catch (error) {
      return BackupValidationResult(
        isValid: false,
        message: 'Backup could not be parsed: $error',
        tableCount: 0,
      );
    }
  }

  Future<void> restoreFromFile(String path) async {
    final validation = await validateFile(path);
    if (!validation.isValid) {
      throw FormatException(validation.message);
    }

    final decoded =
        jsonDecode(await File(path).readAsString()) as Map<String, Object?>;
    final tables = decoded['tables']! as Map<String, Object?>;
    final db = await _db;

    await db.transaction((txn) async {
      await txn.execute('PRAGMA defer_foreign_keys = ON');

      for (final table in _tables.reversed) {
        await txn.delete(table);
      }

      for (final table in _tables) {
        final rows = tables[table]! as List<Object?>;
        for (final row in rows) {
          await txn.insert(
            table,
            Map<String, Object?>.from(row! as Map),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      }
    });
  }
}

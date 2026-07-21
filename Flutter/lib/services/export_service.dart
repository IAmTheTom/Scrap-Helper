import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/database/app_database.dart';

final class ExportService {
  ExportService([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<File> exportJson() async {
    final directory = await getApplicationDocumentsDirectory();
    final exportDirectory = Directory(p.join(directory.path, 'Exports'));
    await exportDirectory.create(recursive: true);
    final file = File(
      p.join(exportDirectory.path, 'scrap_helper_export_${_stamp()}.json'),
    );
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(await buildExportData()),
    );
    return file;
  }

  Future<File> exportLoadSummaryCsv() async {
    final db = await _db;
    final directory = await getApplicationDocumentsDirectory();
    final exportDirectory = Directory(p.join(directory.path, 'Exports'));
    await exportDirectory.create(recursive: true);
    final file = File(
      p.join(exportDirectory.path, 'scrap_helper_loads_${_stamp()}.csv'),
    );

    final rows = await db.rawQuery('''
      SELECT
        l.id,
        l.date,
        l.status,
        COALESCE(es.payout_likely_cents,0) AS estimate_cents,
        COALESCE(SUM(CASE WHEN r.status = 'ACTIVE' THEN r.total_paid_cents ELSE 0 END),0)
          AS actual_cents
      FROM loads l
      LEFT JOIN estimate_snapshots es ON es.load_id = l.id
      LEFT JOIN receipts r ON r.load_id = l.id
      GROUP BY l.id, es.id
      ORDER BY l.date, l.id
      ''');

    final buffer = StringBuffer()
      ..writeln('load_id,date,status,estimate_cents,actual_cents');
    for (final row in rows) {
      buffer.writeln(
        '${row['id']},${row['date']},${row['status']},'
        '${row['estimate_cents']},${row['actual_cents']}',
      );
    }

    await file.writeAsString(buffer.toString());
    return file;
  }

  Future<Map<String, Object?>> buildExportData() async {
    final db = await _db;
    const tables = <String>[
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
    ];

    final data = <String, Object?>{
      'exported_at': DateTime.now().toUtc().toIso8601String(),
      'format_version': 1,
    };
    for (final table in tables) {
      data[table] = await db.query(table);
    }
    return data;
  }

  String _stamp() {
    final now = DateTime.now().toUtc();
    return '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}_'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';
  }
}

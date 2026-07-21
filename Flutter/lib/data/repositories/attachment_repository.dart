import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../database/app_database.dart';
import '../models/attachment_models.dart';

final class AttachmentRepository {
  AttachmentRepository([this._database]);

  final Database? _database;

  Future<Database> get _db async => _database ?? await AppDatabase.instance;

  Future<AttachmentRecord> add({
    required String entityType,
    required int entityId,
    required String sourcePath,
    String? displayName,
    String mediaType = 'IMAGE',
  }) async {
    final source = File(sourcePath);
    if (!await source.exists()) {
      throw ArgumentError('Attachment file does not exist.');
    }

    final documents = await getApplicationDocumentsDirectory();
    final directory = Directory(
      p.join(documents.path, 'Attachments', entityType, '$entityId'),
    );
    await directory.create(recursive: true);

    final timestamp = DateTime.now().toUtc();
    final filename =
        '${timestamp.microsecondsSinceEpoch}_${p.basename(sourcePath)}';
    final storedPath = p.join(directory.path, filename);
    await source.copy(storedPath);

    final record = AttachmentRecord(
      entityType: entityType,
      entityId: entityId,
      filePath: storedPath,
      displayName: displayName ?? p.basename(sourcePath),
      mediaType: mediaType,
      createdAt: timestamp.toIso8601String(),
    );

    final db = await _db;
    final id = await db.insert('attachments', <String, Object?>{
      'entity_type': record.entityType,
      'entity_id': record.entityId,
      'file_path': record.filePath,
      'display_name': record.displayName,
      'media_type': record.mediaType,
      'created_at': record.createdAt,
    });

    return AttachmentRecord(
      id: id,
      entityType: record.entityType,
      entityId: record.entityId,
      filePath: record.filePath,
      displayName: record.displayName,
      mediaType: record.mediaType,
      createdAt: record.createdAt,
    );
  }

  Future<List<AttachmentRecord>> listFor({
    required String entityType,
    required int entityId,
  }) async {
    final db = await _db;
    final rows = await db.query(
      'attachments',
      where: 'entity_type = ? AND entity_id = ?',
      whereArgs: <Object?>[entityType, entityId],
      orderBy: 'created_at DESC',
    );
    return rows.map(AttachmentRecord.fromMap).toList();
  }

  Future<void> remove(AttachmentRecord record) async {
    final db = await _db;
    await db.delete(
      'attachments',
      where: 'id = ?',
      whereArgs: <Object?>[record.id],
    );

    final file = File(record.filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }
}

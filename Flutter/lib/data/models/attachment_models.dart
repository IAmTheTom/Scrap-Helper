final class AttachmentRecord {
  const AttachmentRecord({
    this.id,
    required this.entityType,
    required this.entityId,
    required this.filePath,
    this.displayName,
    this.mediaType = 'IMAGE',
    required this.createdAt,
  });

  final int? id;
  final String entityType;
  final int entityId;
  final String filePath;
  final String? displayName;
  final String mediaType;
  final String createdAt;

  factory AttachmentRecord.fromMap(Map<String, Object?> map) {
    return AttachmentRecord(
      id: map['id'] as int?,
      entityType: map['entity_type'] as String,
      entityId: map['entity_id'] as int,
      filePath: map['file_path'] as String,
      displayName: map['display_name'] as String?,
      mediaType: map['media_type'] as String,
      createdAt: map['created_at'] as String,
    );
  }
}

abstract final class SchemaV5 {
  static const int version = 5;

  static const List<String> statements = <String>[
    '''
CREATE TABLE attachments (
  id INTEGER PRIMARY KEY,
  entity_type TEXT NOT NULL,
  entity_id INTEGER NOT NULL,
  file_path TEXT NOT NULL,
  display_name TEXT,
  media_type TEXT NOT NULL DEFAULT 'IMAGE',
  created_at TEXT NOT NULL,
  CHECK (entity_type IN (
    'OBJECT_TEMPLATE',
    'PICKUP_OPPORTUNITY',
    'STORAGE_ITEM',
    'RECEIPT'
  )),
  CHECK (media_type IN ('IMAGE','DOCUMENT'))
)
''',
    '''
CREATE INDEX idx_attachments_entity
  ON attachments(entity_type, entity_id)
''',
  ];
}

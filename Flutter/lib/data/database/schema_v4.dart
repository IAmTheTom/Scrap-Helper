abstract final class SchemaV4 {
  static const int version = 4;

  static const List<String> statements = <String>[
    '''
CREATE TABLE app_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL
)
''',
    '''
INSERT INTO app_settings(key, value, updated_at)
VALUES ('weight_display_system', 'US_CUSTOMARY', CURRENT_TIMESTAMP)
''',
    '''
INSERT INTO app_settings(key, value, updated_at)
VALUES ('theme_mode', 'SYSTEM', CURRENT_TIMESTAMP)
''',
    '''
INSERT INTO app_settings(key, value, updated_at)
VALUES ('travel_cost_cents_per_mile', '30', CURRENT_TIMESTAMP)
''',
    '''
INSERT INTO app_settings(key, value, updated_at)
VALUES ('default_recovery_level', 'STANDARD', CURRENT_TIMESTAMP)
''',
    '''
INSERT INTO app_settings(key, value, updated_at)
VALUES ('currency_code', 'USD', CURRENT_TIMESTAMP)
''',
  ];
}

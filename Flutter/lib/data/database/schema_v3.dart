abstract final class SchemaV3 {
  static const int version = 3;

  static const List<String> statements = <String>[
    '''
CREATE TABLE pickup_opportunities (
  id INTEGER PRIMARY KEY,
  object_template_id INTEGER REFERENCES object_templates(id) ON DELETE RESTRICT,
  title TEXT NOT NULL,
  source_type TEXT NOT NULL,
  source_reference TEXT,
  location_text TEXT,
  distance_miles_milli INTEGER NOT NULL DEFAULT 0,
  pickup_cost_cents INTEGER NOT NULL DEFAULT 0,
  estimated_low_cents INTEGER NOT NULL DEFAULT 0,
  estimated_likely_cents INTEGER NOT NULL DEFAULT 0,
  estimated_high_cents INTEGER NOT NULL DEFAULT 0,
  estimated_minutes INTEGER NOT NULL DEFAULT 0,
  space_score INTEGER NOT NULL DEFAULT 1,
  confidence TEXT NOT NULL DEFAULT 'LOW',
  deadline_at TEXT,
  status TEXT NOT NULL DEFAULT 'SEEN',
  notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  CHECK (distance_miles_milli >= 0),
  CHECK (pickup_cost_cents >= 0),
  CHECK (estimated_low_cents >= 0),
  CHECK (estimated_likely_cents >= 0),
  CHECK (estimated_high_cents >= 0),
  CHECK (estimated_low_cents <= estimated_likely_cents),
  CHECK (estimated_likely_cents <= estimated_high_cents),
  CHECK (estimated_minutes >= 0),
  CHECK (space_score BETWEEN 1 AND 5),
  CHECK (confidence IN ('LOW','MEDIUM','HIGH','MEASURED')),
  CHECK (status IN ('SEEN','SCHEDULED','COLLECTED','PASSED','EXPIRED'))
)
''',
    '''
CREATE TABLE storage_locations (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT,
  capacity_score INTEGER NOT NULL DEFAULT 3,
  is_active INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  CHECK (capacity_score BETWEEN 1 AND 5),
  CHECK (is_active IN (0,1))
)
''',
    '''
CREATE TABLE storage_items (
  id INTEGER PRIMARY KEY,
  storage_location_id INTEGER NOT NULL
    REFERENCES storage_locations(id) ON DELETE RESTRICT,
  object_template_id INTEGER REFERENCES object_templates(id) ON DELETE RESTRICT,
  label TEXT NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 1,
  estimated_value_cents INTEGER NOT NULL DEFAULT 0,
  estimated_processing_minutes INTEGER NOT NULL DEFAULT 0,
  priority INTEGER NOT NULL DEFAULT 3,
  status TEXT NOT NULL DEFAULT 'WAITING',
  acquired_at TEXT NOT NULL,
  notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  CHECK (quantity > 0),
  CHECK (estimated_value_cents >= 0),
  CHECK (estimated_processing_minutes >= 0),
  CHECK (priority BETWEEN 1 AND 5),
  CHECK (status IN ('WAITING','PROCESSING','READY_FOR_YARD','REMOVED'))
)
''',
    '''
CREATE INDEX idx_pickup_opportunities_status
  ON pickup_opportunities(status, deadline_at)
''',
    '''
CREATE INDEX idx_pickup_opportunities_score_inputs
  ON pickup_opportunities(estimated_likely_cents, distance_miles_milli, estimated_minutes)
''',
    '''
CREATE INDEX idx_storage_items_location_status
  ON storage_items(storage_location_id, status)
''',
    '''
CREATE INDEX idx_storage_items_priority
  ON storage_items(priority, acquired_at)
''',
  ];
}

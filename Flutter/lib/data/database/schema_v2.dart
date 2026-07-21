abstract final class SchemaV2 {
  static const int version = 2;

  static const List<String> statements = <String>[
    '''
ALTER TABLE load_object_items
ADD COLUMN is_active INTEGER NOT NULL DEFAULT 1
CHECK (is_active IN (0, 1))
''',
    '''
CREATE TABLE load_costs (
  id INTEGER PRIMARY KEY,
  load_id INTEGER NOT NULL UNIQUE REFERENCES loads(id) ON DELETE RESTRICT,
  pickup_miles_milli INTEGER NOT NULL DEFAULT 0,
  fuel_cost_cents INTEGER NOT NULL DEFAULT 0,
  purchase_cost_cents INTEGER NOT NULL DEFAULT 0,
  disposal_cost_cents INTEGER NOT NULL DEFAULT 0,
  tire_removal_cost_cents INTEGER NOT NULL DEFAULT 0,
  other_cost_cents INTEGER NOT NULL DEFAULT 0,
  notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  CHECK (pickup_miles_milli >= 0),
  CHECK (fuel_cost_cents >= 0),
  CHECK (purchase_cost_cents >= 0),
  CHECK (disposal_cost_cents >= 0),
  CHECK (tire_removal_cost_cents >= 0),
  CHECK (other_cost_cents >= 0)
)
''',
    '''
CREATE TABLE load_item_outcomes (
  id INTEGER PRIMARY KEY,
  load_object_item_id INTEGER NOT NULL UNIQUE
    REFERENCES load_object_items(id) ON DELETE RESTRICT,
  completed_quantity INTEGER NOT NULL,
  processing_minutes INTEGER NOT NULL DEFAULT 0,
  estimated_likely_cents INTEGER NOT NULL DEFAULT 0,
  allocated_actual_payout_cents INTEGER NOT NULL DEFAULT 0,
  direct_cost_cents INTEGER NOT NULL DEFAULT 0,
  notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  CHECK (completed_quantity > 0),
  CHECK (processing_minutes >= 0),
  CHECK (estimated_likely_cents >= 0),
  CHECK (allocated_actual_payout_cents >= 0),
  CHECK (direct_cost_cents >= 0)
)
''',
    '''
CREATE INDEX idx_load_costs_load
  ON load_costs(load_id)
''',
    '''
CREATE INDEX idx_load_item_outcomes_item
  ON load_item_outcomes(load_object_item_id)
''',
  ];
}

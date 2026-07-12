PRAGMA foreign_keys = ON;

CREATE TABLE app_metadata (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE scrap_categories (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT,
  source_type TEXT NOT NULL,
  source_notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  is_active INTEGER NOT NULL DEFAULT 1,
  CHECK (source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT')),
  CHECK (is_active IN (0,1))
);

CREATE TABLE scrapyards (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  location TEXT,
  phone TEXT,
  website TEXT,
  notes TEXT,
  source_type TEXT NOT NULL,
  source_notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  is_active INTEGER NOT NULL DEFAULT 1,
  CHECK (source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT')),
  CHECK (is_active IN (0,1))
);

CREATE TABLE yard_prices (
  id INTEGER PRIMARY KEY,
  scrapyard_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  yard_category_name TEXT NOT NULL,
  rate_units INTEGER NOT NULL,
  rate_unit TEXT NOT NULL,
  fee_scope TEXT NOT NULL DEFAULT 'NONE',
  fee_amount_cents INTEGER NOT NULL DEFAULT 0,
  fee_rate_units INTEGER NOT NULL DEFAULT 0,
  fee_unit TEXT,
  effective_from TEXT NOT NULL,
  effective_to TEXT,
  source_type TEXT NOT NULL,
  source_notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  is_active INTEGER NOT NULL DEFAULT 1,
  FOREIGN KEY (scrapyard_id) REFERENCES scrapyards(id) ON DELETE RESTRICT,
  FOREIGN KEY (category_id) REFERENCES scrap_categories(id) ON DELETE RESTRICT,
  CHECK (rate_units >= 0),
  CHECK (rate_unit IN ('PER_GRAM','PER_KILOGRAM','PER_OUNCE','PER_POUND','PER_SHORT_TON','PER_METRIC_TONNE','PER_ITEM')),
  CHECK (fee_scope IN ('NONE','PER_UNIT','PER_ITEM','PER_LOAD')),
  CHECK (
    (fee_scope = 'NONE' AND fee_amount_cents = 0 AND fee_rate_units = 0 AND fee_unit IS NULL)
    OR
    (fee_scope = 'PER_UNIT' AND fee_amount_cents = 0 AND fee_rate_units > 0
      AND fee_unit IN ('PER_GRAM','PER_KILOGRAM','PER_OUNCE','PER_POUND','PER_SHORT_TON','PER_METRIC_TONNE'))
    OR
    (fee_scope = 'PER_ITEM' AND fee_amount_cents >= 0 AND fee_rate_units = 0 AND fee_unit IS NULL)
    OR
    (fee_scope = 'PER_LOAD' AND fee_amount_cents >= 0 AND fee_rate_units = 0 AND fee_unit IS NULL)
  ),
  CHECK (effective_to IS NULL OR effective_to >= effective_from),
  CHECK (source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT')),
  CHECK (is_active IN (0,1)),
  UNIQUE (scrapyard_id, category_id, effective_from)
);

CREATE TABLE object_templates (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  subtype TEXT NOT NULL DEFAULT '',
  description TEXT,
  whole_weight_low_g INTEGER NOT NULL,
  whole_weight_typical_g INTEGER NOT NULL,
  whole_weight_high_g INTEGER NOT NULL,
  weight_confidence TEXT NOT NULL,
  resale_check_required INTEGER NOT NULL DEFAULT 0,
  tools_needed TEXT,
  safety_warnings TEXT,
  preparation_notes TEXT,
  source_type TEXT NOT NULL,
  source_notes TEXT,
  seed_version TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  is_active INTEGER NOT NULL DEFAULT 1,
  CHECK (whole_weight_low_g >= 0),
  CHECK (whole_weight_low_g <= whole_weight_typical_g),
  CHECK (whole_weight_typical_g <= whole_weight_high_g),
  CHECK (weight_confidence IN ('LOW','MEDIUM','HIGH','MEASURED')),
  CHECK (resale_check_required IN (0,1)),
  CHECK (source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT')),
  CHECK (is_active IN (0,1)),
  UNIQUE (name, subtype)
);

CREATE TABLE recoverable_components (
  id INTEGER PRIMARY KEY,
  object_template_id INTEGER NOT NULL,
  component_name TEXT NOT NULL,
  yield_kind TEXT NOT NULL,
  category_id INTEGER NOT NULL,
  recovery_level TEXT NOT NULL,
  low_weight_g INTEGER NOT NULL,
  typical_weight_g INTEGER NOT NULL,
  high_weight_g INTEGER NOT NULL,
  confidence TEXT NOT NULL,
  item_count INTEGER,
  sort_order INTEGER NOT NULL DEFAULT 0,
  source_type TEXT NOT NULL,
  source_notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  is_active INTEGER NOT NULL DEFAULT 1,
  FOREIGN KEY (object_template_id) REFERENCES object_templates(id) ON DELETE RESTRICT,
  FOREIGN KEY (category_id) REFERENCES scrap_categories(id) ON DELETE RESTRICT,
  CHECK (yield_kind IN ('WHOLE_OBJECT','RECOVERED_COMPONENT','REMAINDER')),
  CHECK (recovery_level IN ('SELL_WHOLE','QUICK','STANDARD','DEEP')),
  CHECK (low_weight_g >= 0),
  CHECK (low_weight_g <= typical_weight_g),
  CHECK (typical_weight_g <= high_weight_g),
  CHECK (confidence IN ('LOW','MEDIUM','HIGH','MEASURED')),
  CHECK (item_count IS NULL OR item_count > 0),
  CHECK (sort_order >= 0),
  CHECK (source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT')),
  CHECK (is_active IN (0,1)),
  UNIQUE (object_template_id, component_name, category_id, recovery_level, yield_kind)
);

CREATE TABLE loads (
  id INTEGER PRIMARY KEY,
  scrapyard_id INTEGER,
  date TEXT NOT NULL,
  notes TEXT,
  status TEXT NOT NULL DEFAULT 'DRAFT',
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (scrapyard_id) REFERENCES scrapyards(id) ON DELETE RESTRICT,
  CHECK (status IN ('DRAFT','FINALIZED'))
);

CREATE TABLE load_object_items (
  id INTEGER PRIMARY KEY,
  load_id INTEGER NOT NULL,
  object_template_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  recovery_level TEXT NOT NULL,
  notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (load_id) REFERENCES loads(id) ON DELETE CASCADE,
  FOREIGN KEY (object_template_id) REFERENCES object_templates(id) ON DELETE RESTRICT,
  CHECK (quantity > 0),
  CHECK (recovery_level IN ('SELL_WHOLE','QUICK','STANDARD','DEEP'))
);

CREATE TABLE load_material_items (
  id INTEGER PRIMARY KEY,
  load_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  measured_weight_g INTEGER NOT NULL,
  uncertainty_low_g INTEGER,
  uncertainty_high_g INTEGER,
  linked_object_item_id INTEGER,
  source_type TEXT NOT NULL,
  source_notes TEXT,
  notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (load_id) REFERENCES loads(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES scrap_categories(id) ON DELETE RESTRICT,
  FOREIGN KEY (linked_object_item_id) REFERENCES load_object_items(id) ON DELETE RESTRICT,
  CHECK (measured_weight_g >= 0),
  CHECK (uncertainty_low_g IS NULL OR uncertainty_low_g >= 0),
  CHECK (uncertainty_high_g IS NULL OR uncertainty_high_g >= 0),
  CHECK (uncertainty_low_g IS NULL OR uncertainty_low_g <= measured_weight_g),
  CHECK (uncertainty_high_g IS NULL OR measured_weight_g <= uncertainty_high_g),
  CHECK (source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT'))
);

CREATE UNIQUE INDEX idx_unique_linked_material_override
  ON load_material_items(linked_object_item_id, category_id)
  WHERE linked_object_item_id IS NOT NULL;

CREATE TRIGGER trg_load_material_link_insert
BEFORE INSERT ON load_material_items
WHEN NEW.linked_object_item_id IS NOT NULL
BEGIN
  SELECT CASE WHEN NOT EXISTS (
    SELECT 1 FROM load_object_items
    WHERE id = NEW.linked_object_item_id AND load_id = NEW.load_id
  ) THEN RAISE(ABORT, 'Linked object item must belong to the same load') END;
END;

CREATE TRIGGER trg_load_material_link_update
BEFORE UPDATE OF load_id, linked_object_item_id ON load_material_items
WHEN NEW.linked_object_item_id IS NOT NULL
BEGIN
  SELECT CASE WHEN NOT EXISTS (
    SELECT 1 FROM load_object_items
    WHERE id = NEW.linked_object_item_id AND load_id = NEW.load_id
  ) THEN RAISE(ABORT, 'Linked object item must belong to the same load') END;
END;

CREATE TABLE receipts (
  id INTEGER PRIMARY KEY,
  load_id INTEGER NOT NULL,
  scrapyard_id INTEGER NOT NULL,
  date TEXT NOT NULL,
  total_paid_cents INTEGER NOT NULL,
  receipt_level_adjustment_cents INTEGER NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'ACTIVE',
  void_reason TEXT,
  voided_at TEXT,
  source_type TEXT NOT NULL,
  source_notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (load_id) REFERENCES loads(id) ON DELETE RESTRICT,
  FOREIGN KEY (scrapyard_id) REFERENCES scrapyards(id) ON DELETE RESTRICT,
  CHECK (total_paid_cents >= 0),
  CHECK (status IN ('ACTIVE','VOID')),
  CHECK (
    (status = 'ACTIVE' AND void_reason IS NULL AND voided_at IS NULL)
    OR
    (status = 'VOID' AND void_reason IS NOT NULL AND length(trim(void_reason)) > 0 AND voided_at IS NOT NULL)
  ),
  CHECK (source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT'))
);

CREATE TABLE receipt_lines (
  id INTEGER PRIMARY KEY,
  receipt_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  yard_category_name TEXT NOT NULL,
  weight_g INTEGER NOT NULL,
  source_weight_value TEXT,
  source_weight_unit TEXT,
  rate_units INTEGER NOT NULL,
  rate_unit TEXT NOT NULL,
  line_payout_cents INTEGER NOT NULL,
  line_adjustment_cents INTEGER NOT NULL DEFAULT 0,
  notes TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  FOREIGN KEY (receipt_id) REFERENCES receipts(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES scrap_categories(id) ON DELETE RESTRICT,
  CHECK (weight_g >= 0),
  CHECK (rate_units >= 0),
  CHECK (rate_unit IN ('PER_GRAM','PER_KILOGRAM','PER_OUNCE','PER_POUND','PER_SHORT_TON','PER_METRIC_TONNE','PER_ITEM')),
  CHECK (line_payout_cents >= 0)
);

CREATE TABLE estimate_snapshots (
  id INTEGER PRIMARY KEY,
  load_id INTEGER NOT NULL UNIQUE,
  snapshot_version TEXT NOT NULL,
  calculation_schema TEXT NOT NULL,
  scrapyard_id INTEGER,
  rates_json TEXT NOT NULL,
  yields_json TEXT NOT NULL,
  recovery_levels_json TEXT NOT NULL,
  estimated_category_weights_json TEXT NOT NULL,
  payout_low_cents INTEGER NOT NULL,
  payout_likely_cents INTEGER NOT NULL,
  payout_high_cents INTEGER NOT NULL,
  notes TEXT,
  created_at TEXT NOT NULL,
  FOREIGN KEY (load_id) REFERENCES loads(id) ON DELETE RESTRICT,
  FOREIGN KEY (scrapyard_id) REFERENCES scrapyards(id) ON DELETE RESTRICT,
  CHECK (payout_low_cents >= 0),
  CHECK (payout_low_cents <= payout_likely_cents),
  CHECK (payout_likely_cents <= payout_high_cents)
);

CREATE TABLE load_calibration_observations (
  id INTEGER PRIMARY KEY,
  load_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  estimated_weight_g INTEGER,
  actual_weight_g INTEGER,
  estimated_payout_cents INTEGER,
  actual_payout_cents INTEGER,
  notes TEXT,
  source_type TEXT,
  created_at TEXT NOT NULL,
  FOREIGN KEY (load_id) REFERENCES loads(id) ON DELETE RESTRICT,
  FOREIGN KEY (category_id) REFERENCES scrap_categories(id) ON DELETE RESTRICT,
  CHECK (estimated_weight_g IS NULL OR estimated_weight_g >= 0),
  CHECK (actual_weight_g IS NULL OR actual_weight_g >= 0),
  CHECK (estimated_payout_cents IS NULL OR estimated_payout_cents >= 0),
  CHECK (actual_payout_cents IS NULL OR actual_payout_cents >= 0),
  CHECK (source_type IS NULL OR source_type IN ('MANUAL','WEBSITE','RECEIPT','PHONE','RESEARCH','MEASURED','SEED','IMPORT'))
);

CREATE INDEX idx_yard_prices_scrapyard_category_effective
  ON yard_prices(scrapyard_id, category_id, effective_from);
CREATE INDEX idx_recoverable_components_template_recovery
  ON recoverable_components(object_template_id, recovery_level);
CREATE INDEX idx_load_object_items_load ON load_object_items(load_id);
CREATE INDEX idx_load_material_items_load ON load_material_items(load_id);
CREATE INDEX idx_load_material_items_linked ON load_material_items(linked_object_item_id);
CREATE INDEX idx_receipts_load_status ON receipts(load_id, status);
CREATE INDEX idx_receipt_lines_receipt ON receipt_lines(receipt_id);
CREATE INDEX idx_receipt_lines_category ON receipt_lines(category_id);
CREATE INDEX idx_load_calibration_observations_load_category
  ON load_calibration_observations(load_id, category_id);

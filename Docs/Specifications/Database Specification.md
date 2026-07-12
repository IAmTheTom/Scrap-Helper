# Database Specification

## General Rules

- SQLite foreign keys enabled on every connection.
- All normalized weights stored as integer grams.
- Final payouts and adjustments stored as integer cents.
- Rates stored with 10,000 rate units per dollar.
- Editable reference records use `is_active`.
- Loads use `DRAFT` and `FINALIZED`.
- Receipts use `ACTIVE` and `VOID`.
- Snapshots are immutable.

## Main Tables

- app_metadata
- scrap_categories
- scrapyards
- yard_prices
- object_templates
- recoverable_components
- loads
- load_object_items
- load_material_items
- receipts
- receipt_lines
- estimate_snapshots
- load_calibration_observations

## Historical Integrity

Finalized estimates use snapshot JSON and stored payout totals. Later edits to prices, templates, components, or category names cannot alter historical estimates.

## Linked Material Rule

A linked measured-material row replaces only the aggregated estimate for:

- one load object item;
- one category.

Unlinked measured material remains additive.

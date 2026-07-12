# Database Schema

## Purpose

This document describes the authoritative SQLite schema for Scrap Helper.

The executable schema is stored in:

`SQL\schema_v1.sql`

## Storage Rules

- All normalized physical weights are stored as integer grams.
- Final payouts, fees, and adjustments are stored as integer cents.
- Scrap rates use 10,000 rate units per dollar.
- SQLite foreign-key enforcement must be enabled on every connection.
- Editable reference records use `is_active`.
- Loads use `DRAFT` and `FINALIZED`.
- Receipts use `ACTIVE` and `VOID`.
- Estimate snapshots are immutable.

## Tables

### app_metadata

Stores local schema and seed metadata.

### scrap_categories

Canonical application categories such as shred steel, transformers, motors, wire, circuit boards, brass, and aluminum.

### scrapyards

User-editable scrapyard profiles.

### yard_prices

Effective-dated rates, units, fee rules, yard category wording, and source information.

### object_templates

Editable whole-object records with subtype, whole-weight range, safety notes, tools, preparation, and source information.

### recoverable_components

Expected components and remainders by object template and recovery level.

### loads

Draft and finalized yard-load records.

### load_object_items

Object-template entries added to a load.

### load_material_items

Measured categorized material. A material entry may optionally replace one object-item/category estimate.

### receipts

One load may have multiple independently viewable receipts.

### receipt_lines

Actual category, weight, rate, line payout, and line adjustment records.

### estimate_snapshots

One immutable finalized estimate per load.

### load_calibration_observations

Reserved comparison records for later personal calibration features.

## Relationship Rules

- Reference records are deactivated rather than deleted.
- Draft load children may be removed with the draft load.
- Finalized loads cannot be deleted through normal application behavior.
- Receipt lines belong to one receipt.
- Persisted receipts are voided rather than silently deleted.
- A load has at most one estimate snapshot.
- A linked measured-material record must reference an object item in the same load.
- Only one linked replacement may exist for one object-item/category pair.

## Finalization Transaction

One SQLite transaction must:

1. Verify the load exists and is `DRAFT`.
2. Read required rates, templates, components, object items, and measured materials through the transaction handle.
3. Run the deterministic calculator.
4. Insert the immutable snapshot.
5. Update the load with a conditional `DRAFT` to `FINALIZED` update.
6. Verify exactly one load row changed.
7. Commit.

Any failure rolls back all steps.

## Schema Version

Initial schema version: `1`

The application must record schema metadata in `app_metadata` and use SQLite migration versioning for later changes.

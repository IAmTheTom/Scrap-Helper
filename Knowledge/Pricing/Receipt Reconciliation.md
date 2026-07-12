# Receipt Reconciliation

## Purpose

Compare the finalized estimate snapshot with actual scrapyard results.

## Receipt Structure

A load may have multiple receipts.

Each receipt contains:

- yard;
- date;
- total paid;
- receipt-level adjustment;
- status;
- one or more receipt lines.

Each line contains:

- canonical category;
- yard category name;
- normalized weight in grams;
- original printed weight and unit when available;
- applied rate and unit;
- line payout;
- line adjustment.

## Total Rule

Calculated receipt total equals:

`sum(line payout + line adjustment) + receipt-level adjustment`

## Tolerance

- Exact match: valid.
- One-cent difference: acceptable rounding tolerance.
- Larger difference: requires an explicit adjustment or correction.

## Void Rules

- Receipts are not silently deleted.
- VOID requires a reason and timestamp.
- VOID receipts are excluded from load totals and reconciliation.

## Load Actuals

- Actual load payout equals the sum of ACTIVE receipt totals.
- Actual category weights and payouts combine ACTIVE receipt lines.
- Receipt identity remains preserved for review.

## Calibration Limits

A mixed receipt may improve load-level and category-level history.

It must not automatically rewrite one object's template unless the recovered material was explicitly linked to that object or batch.

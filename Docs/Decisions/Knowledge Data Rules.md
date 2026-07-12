# Knowledge Data Rules

## Separation of Data

Scrap Helper maintains three distinct layers.

### Reference Knowledge
General researched information about objects, components, materials, hazards, and likely recovery patterns.

### Personal Measurements
Actual weights, processing times, notes, and recovery results recorded by the user.

### Yard and Receipt Data
Yard categories, rates, preparation requirements, fees, actual receipt weights, and payouts.

These layers may be compared, but they must not overwrite one another silently.

## Confidence

Allowed confidence values:

- LOW
- MEDIUM
- HIGH
- MEASURED

Confidence does not change calculations numerically in MVP. It communicates evidence quality.

## Weight Storage

All app-normalized weights use integer grams.

Knowledge files may show pounds and metric values for readability, but the seed-data conversion must use grams.

## Uncertainty

Object and component estimates use low, typical, and high values.

Unknown values may remain unknown during research. Do not invent values solely to complete a table.

## Source Preservation

Every seeded numeric claim must preserve:

- source type;
- source note or Source ID;
- confidence;
- subtype context.

## Template Protection

Bundled default templates seed only empty relevant tables.

Application updates must never overwrite user-edited templates.

## Safety

Safety records take priority over value optimization.

The app must not encourage:

- sealed refrigerant-system cutting;
- propane-container processing;
- destructive microwave magnetron handling;
- unsafe capacitor contact;
- crushing or grinding hazardous components;
- processing prohibited or rejected materials.

## Historical Integrity

Finalized load snapshots and receipts remain historical records.

Later edits to templates, prices, or categories must not change earlier estimates or actual results.

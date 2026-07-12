# Calculation Engine

The calculation engine is pure Dart and has no UI or database dependency.

## Inputs

- selected scrapyard rates;
- load object items;
- object quantity;
- recovery level;
- recoverable component ranges;
- measured material ranges;
- linked override relationships;
- fee rules.

## Outputs

- low payout cents;
- likely payout cents;
- high payout cents;
- category weight ranges;
- category payout ranges;
- warnings;
- missing-rate categories;
- calculation version.

## Rounding

Use signed round-half-up with integer arithmetic.

## Per-Load Fees

Apply each distinct yard-price `PER_LOAD` fee at most once per load.

## Invalid Conditions

The engine returns or throws explicit errors for:

- negative weights;
- invalid ranges;
- missing required item counts;
- per-item rates without valid count;
- contradictory linked overrides;
- unsupported units.

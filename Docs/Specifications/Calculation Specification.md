# Calculation Specification

## Internal Units

- weight: integer grams
- payout: integer cents
- rate precision: 10,000 rate units per dollar
- rate units per cent: 100

## Display Units

- gram
- kilogram
- ounce
- pound
- short ton
- metric tonne

Switching display systems never rewrites stored values.

## Recovery Calculation

For each load object item:

1. Select active components matching its template and recovery level.
2. Multiply every low / typical / high component weight by object quantity.
3. Aggregate by object item and category.
4. Apply any explicit linked measured-material replacement.
5. Add all unlinked measured materials.
6. Apply the selected yard rate by category.
7. Apply relevant fees.
8. Sum low / likely / high totals.

## Weight-Based Payout

`payout cents = round-half-up(weight grams × conversion denominator × rate units ÷ conversion numerator ÷ 100)`

## Per-Item Payout

`payout cents = round-half-up(item count × rate units ÷ 100)`

## Confidence

Confidence is informational in MVP:

- LOW
- MEDIUM
- HIGH
- MEASURED

It does not apply a numeric multiplier.

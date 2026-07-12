# Price History Rules

## History Model

Each price change creates a new record rather than editing the historical record used by earlier loads.

## Current Price

The current price is the active record with the latest applicable effective date for:

- one yard;
- one canonical category;
- one preparation grade.

## Historical Integrity

A finalized load uses its immutable snapshot. Later price edits must not change:

- earlier estimated payout;
- earlier category calculations;
- receipt comparisons.

## Stale Price Warning

The app may warn that a price is old, but it must not invent a universal expiration period.

The stale threshold should be configurable later.

## Corrections

If a price was entered incorrectly:

- retain the original if it was used by a finalized load;
- create a corrected record;
- add a source note explaining the correction;
- do not rewrite historical snapshots.

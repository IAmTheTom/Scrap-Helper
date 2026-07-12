# Application Specification

## Primary Workflow

1. See or collect an item.
2. Select or create an object template.
3. Choose a recovery level.
4. Review expected categories, hazards, and payout range.
5. Add the item or measured material to a draft load.
6. Finalize the load before the yard run.
7. Record one or more receipts.
8. Compare estimated and actual results.

## Required MVP Features

- editable categories;
- editable scrapyards;
- effective-dated yard prices;
- editable object templates;
- editable recoverable components;
- sell-whole, quick, standard, and deep recovery levels;
- low / typical / high estimates;
- measured-material entry;
- linked override of one object/category estimate;
- draft and finalized loads;
- immutable estimate snapshots;
- multiple receipts and receipt lines;
- active and void receipt states;
- estimate-versus-actual history;
- JSON backup and restore;
- CSV export;
- US customary and metric display.

## Offline Behavior

All core functions work without internet access.

## AI Boundary

AI is not required for the MVP.

A future vision helper may identify or locate objects in an image. It may not:

- determine exact grade;
- determine exact weight;
- set current prices;
- make safety decisions;
- calculate payout independently.

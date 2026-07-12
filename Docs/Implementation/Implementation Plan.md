# Implementation Plan

## Working Rule

Implement one bounded batch, run formatting, analysis, and tests, then commit before moving forward.

## Batch Order

1. Flutter app shell
2. Core enums and mappings
3. Integer unit parser and converter
4. Rate and fee helpers
5. SQLite database and schema
6. Database tests
7. Categories
8. Scrapyards
9. Yard prices
10. Object templates
11. Recoverable components
12. Calculation engine
13. Loads and load items
14. Load builder
15. Finalization and snapshots
16. Receipts and reconciliation
17. History
18. Backup and export
19. Field testing
20. Optional image identification

## Required Validation After Each Batch

```powershell
flutter format .
flutter analyze
flutter test
```

Android launch checks are added once the app shell exists.

# Scrap Helper Pack 11 — Finalize, Receipts, and History

This pack closes the first full estimate-to-actual loop.

## Functional workflow

1. Build a draft load.
2. Review its estimated payout.
3. Finalize and lock the estimate.
4. Open Load History.
5. Enter one or more yard receipt lines.
6. Save the actual receipt.
7. Compare estimated likely payout with actual payout.

## Added

- immutable load finalization transaction
- estimate snapshot JSON contracts
- finalized load history
- receipt headers and category lines
- weight and rate entry in pounds and dollars per pound
- calculated line payouts
- signed receipt adjustments
- actual-versus-estimated comparison
- receipt repository tests
- currency parsing tests

## Install

Extract directly into:

C:\Users\tnkfi\AI Building\Scrap Helper

Allow Windows to merge the included `Tools` folder.

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Run-Pack-11.ps1"
& ".\Tools\Run-Pack-11.ps1"
```

## After success

```powershell
git add .
git commit -m "Add finalized loads receipts and history"
git push
```

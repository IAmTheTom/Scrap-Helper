# Scrap Helper Pack 12–14 — Decision Intelligence

This combined bundle adds the evidence and recommendation layer.

## Adds

- schema version 2 migration
- load-level pickup miles and direct costs
- per-object processing time
- per-object allocated estimate and actual payout
- per-object direct costs
- personal object performance aggregation
- net payout per item
- net payout per processing hour
- estimate accuracy
- deterministic recommendation engine
- High Priority, Keep Targeting, Selective, Bundle Only, Low Priority, and Insufficient Data states
- Personal Performance dashboard
- Work & Costs entry from finalized Load History
- migration, repository, and recommendation tests

## Important design choice

Actual receipt payouts are entered at the load/category level, while object performance requires attribution.
This pack therefore asks the user to allocate estimate and actual payout among the objects in a finalized load.
The allocation is explicit instead of pretending the app can infer an exact object-level payout from a mixed yard receipt.

## Install

Extract directly into:

C:\Users\tnkfi\AI Building\Scrap Helper

Allow Windows to merge the included `Tools` folder.

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Run-Pack-12-14.ps1"
& ".\Tools\Run-Pack-12-14.ps1"
```

## Commit after success

```powershell
git add .
git commit -m "Add costs performance analytics and recommendations"
git push
```

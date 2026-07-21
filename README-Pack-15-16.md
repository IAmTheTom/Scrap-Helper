# Scrap Helper Pack 15–16 — Opportunities and Storage

This bundle adds pickup decision planning and waiting-to-process storage tracking.

## Pickup Opportunities

- title, source, location, and distance
- purchase/pickup cost
- low, likely, and high payout
- estimated processing time
- space requirement
- confidence
- Seen, Scheduled, Collected, Passed, and Expired states
- deterministic 0–100 opportunity score
- Pass, Bundle Only, Pick Up Selectively, and High Priority decisions
- queue ranking by score

The travel-cost portion currently uses a documented planning assumption of $0.30 per mile.
A later Settings pack will make this configurable.

## Storage Intelligence

- seeded Garage, Trailer, and Sorted Bins locations
- waiting item quantity
- estimated stored value
- estimated processing time
- priority
- Waiting, Processing, Ready for Yard, and Removed states
- summaries by storage location
- prioritized processing queue

## Install

Extract directly into:

C:\Users\tnkfi\AI Building\Scrap Helper

Allow Windows to merge the included `Tools` folder.

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Run-Pack-15-16.ps1"
& ".\Tools\Run-Pack-15-16.ps1"
```

## Commit after success

```powershell
git add .
git commit -m "Add pickup opportunities and storage intelligence"
git push
```

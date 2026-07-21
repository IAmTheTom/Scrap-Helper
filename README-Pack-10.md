# Scrap Helper Pack 10 — First Usable App

This pack creates the first functional vertical slice.

## What works after installation

1. Open the app.
2. Enter current EH Recycling prices by category.
3. Browse eight common starter objects.
4. Review object safety and preparation notes.
5. Select Sell Whole, Quick, Standard, or Deep recovery.
6. Add an object and quantity to the current load.
7. Change recovery levels from the current load.
8. See low, likely, and high payout estimates.
9. See exactly which material prices are still missing.
10. Close and reopen the app without losing the draft load.

## Important data warning

The bundled object and component weights are intentionally broad, LOW-confidence
starter ranges. They make the workflow functional, but they are not presented as
verified local facts. Replace and calibrate them from actual measurements and
receipts.

No material prices are seeded. The user must enter current yard prices.

## Install

Extract this ZIP directly into:

C:\Users\tnkfi\AI Building\Scrap Helper

Allow Windows to merge the included `Tools` folder.

Then run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Run-Pack-10.ps1"
& ".\Tools\Run-Pack-10.ps1"
```

## Run on Windows for a quick check

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper\Flutter"
flutter run -d windows
```

## Commit after success

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
git add .
git commit -m "Add first usable Scrap Helper workflow"
git push
```

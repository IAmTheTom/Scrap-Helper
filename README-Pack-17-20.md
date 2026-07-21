# Scrap Helper Pack 17–20 — Productivity and Dashboard

This bundle turns the launcher into an operational dashboard and adds reporting,
search, settings, and local export.

## Operational dashboard

- this-month gross, costs, and net
- lifetime net
- finalized load count
- active pickup count
- stored item count and stored value
- current draft quantity
- top personal performer
- quick actions
- pull-to-refresh

## Reports

- Today
- Last 7 Days
- This Month
- This Year
- Lifetime
- gross, direct costs, net
- net/hour and net/mile
- load and receipt counts
- processing hours
- estimate accuracy

## Universal search

Searches:

- object templates
- scrap categories
- pickup opportunities
- storage items
- loads

## Settings

- US customary or Metric
- System, Light, or Dark theme preference
- configurable planning travel cost in cents per mile
- default recovery level
- currency code storage

Theme and display preferences are persisted here. Applying them throughout every
screen is reserved for the final field-polish bundle.

## Export

- full local JSON dataset
- load-summary CSV
- files written to the app documents `Exports` directory

## Install

Extract directly into:

C:\Users\tnkfi\AI Building\Scrap Helper

Allow Windows to merge the included `Tools` folder.

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Run-Pack-17-20.ps1"
& ".\Tools\Run-Pack-17-20.ps1"
```

## Commit after success

```powershell
git add .
git commit -m "Add operational dashboard reports search settings and export"
git push
```

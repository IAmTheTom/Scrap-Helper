# Scrap Helper Pack 21–24 — Productization

This bundle adds the first release-oriented productization layer.

## Backup and restore

- complete JSON backup
- backup format versioning
- structural validation before restore
- explicit destructive-restore confirmation
- transactional database replacement
- backups stored in the app documents `Backups` directory

## Attachments

- local attachment table
- copies selected files into app-managed storage
- image and PDF support
- reusable attachment page for:
  - object templates
  - pickup opportunities
  - storage items
  - receipts

The reusable page and repository are included. Entity screens can link to it in
the next UI-polish pass without another schema change.

## Field and theme foundation

- actual light and dark themes
- adaptive visual density
- persisted theme setting remains available
- settings page now links to Backup & Restore

## Release tooling

- Android release build script
- Windows release build script
- analyzer and tests run before builds
- APK existence validation
- app version constant set to 0.9.0

## Dependency

This pack adds `file_picker` for selecting backup and attachment files.

## Install

Extract directly into:

C:\Users\tnkfi\AI Building\Scrap Helper

Allow Windows to merge the included `Tools` folder.

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Run-Pack-21-24.ps1"
& ".\Tools\Run-Pack-21-24.ps1"
```

## Commit after success

```powershell
git add .
git commit -m "Add backup restore attachments and release tooling"
git push
```

## Build commands after validation

Android:

```powershell
Unblock-File ".\Tools\Build-Android-Release.ps1"
& ".\Tools\Build-Android-Release.ps1"
```

Windows:

```powershell
Unblock-File ".\Tools\Build-Windows-Release.ps1"
& ".\Tools\Build-Windows-Release.ps1"
```

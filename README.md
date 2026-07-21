# Scrap Helper Pack 09 — Database Layer

This pack installs and validates the first working SQLite layer.

## Adds

- sqflite
- path
- path_provider
- flutter_riverpod
- sqflite_common_ffi
- executable schema_v1.dart
- AppDatabase opener
- foreign-key enforcement
- schema metadata initialization
- database constraint and trigger tests

## Install

Copy all PowerShell scripts from this pack into:

C:\Users\tnkfi\AI Building\Scrap Helper\Tools

Then run from the Scrap Helper project root:

```powershell
Unblock-File ".\Tools\Run-Pack-09.ps1"
& ".\Tools\Run-Pack-09.ps1"
```

## Success criteria

The output must end with:

SQLite database layer installed and validated successfully.
Schema statements: 25

Do not commit if the pack reports an error.

# Scrap Helper Pack 26 — Operational Integration Coverage

This pack expands automated coverage and restores a direct **Finalize Current Load** entry in the utility menu.

## Added coverage

- create a stored item;
- verify it remains after leaving and returning to Storage;
- ensure a draft load has an object;
- finalize and lock the current load;
- verify the finalized load appears in history;
- add a receipt;
- verify actual payout appears;
- open Backup & Restore;
- run every integration test in the `integration_test` directory.

## Install

Extract directly into:

```text
C:\Users\tnkfi\AI Building\Scrap Helper
```

Then run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"

Unblock-File ".\Tools\Setup-26-Operational-Integration.ps1"
Unblock-File ".\Tools\Run-Integration-Tests.ps1"
Unblock-File ".\Tools\Run-Full-Validation.ps1"

& ".\Tools\Setup-26-Operational-Integration.ps1"
```

Run the integration suite:

```powershell
& ".\Tools\Run-Integration-Tests.ps1" -Device windows
```

Run the complete validation gate:

```powershell
& ".\Tools\Run-Full-Validation.ps1"
```

Repeated runs create development records named `Integration Test Electric Motor` and may create additional finalized loads and receipts.

# Scrap Helper Pack 25 — Automated Integration Testing

Extract this ZIP directly into:

C:\Users\tnkfi\AI Building\Scrap Helper

Then run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Setup-25-Integration-Tests.ps1"
& ".\Tools\Setup-25-Integration-Tests.ps1"
```

Run on Windows:

```powershell
& ".\Tools\Run-Integration-Tests.ps1" -Device windows
```

Run full validation:

```powershell
& ".\Tools\Run-Full-Validation.ps1"
```

The integration test launches the real app, checks all five primary tabs, searches for Microwave, adds it to the current load, creates a test pickup, and opens Reports through the utility menu.

The test creates a pickup named `Integration Test Microwave Pickup`. Repeated runs may leave multiple copies in the local development database.

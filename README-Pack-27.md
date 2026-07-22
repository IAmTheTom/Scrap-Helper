# Scrap Helper Pack 27 — AI Foundation

This pack adds a privacy-first AI architecture and the first visible **Item Advisor** workflow.

## What it adds

- provider-neutral `ItemAnalysisProvider` contract;
- structured analysis request/result models;
- deterministic offline scrap advisor;
- simulated AI provider for UI and integration development;
- automatic fallback when AI is disabled, unavailable, or disallowed;
- clear distinction between calculated estimates and AI suggestions;
- Item Advisor page in the three-dot utility menu;
- unit tests and an integration smoke test.

## Important

This phase does **not** send photos or text to any cloud service. It does not require an API key. Simulated AI is development-only and runs locally.

The default remains deterministic and offline.

## Install

Extract directly into:

```text
C:\Users\tnkfi\AI Building\Scrap Helper
```

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"

Unblock-File ".\Tools\Setup-27-AI-Foundation.ps1"

& ".\Tools\Setup-27-AI-Foundation.ps1"
```

Then run the AI workflow:

```powershell
cd ".\Flutter"

flutter test `
  integration_test\ai_foundation_test.dart `
  -d windows `
  --reporter expanded
```

To view it manually:

```powershell
flutter run -d windows
```

Open the three-dot menu and choose **Item Advisor**.

# Scrap Helper Pack 34 — Offline AI Wiring

This pack connects the previously separate AI components into the user workflow.

## Added

- installed-model discovery;
- validation of the newest local model pack;
- local image preprocessing and TFLite classification execution;
- conversion of local-model scores into recognition detections;
- adaptive clarification after local inference;
- automatic Recognition Review navigation;
- deterministic fallback when no valid model is installed;
- **Local AI Model** in the utility menu;
- Item Advisor status explaining whether a local model ran;
- integration test for Item Advisor and model-management access.

## Behavior

With a compatible local classification model installed:

```text
Photo
→ local TFLite inference
→ ranked recognition result
→ adaptive clarification only when useful
→ Recognition Review
```

Without a compatible model:

```text
Photo or description
→ clear “no local model installed” status
→ deterministic offline advice
```

Nothing is uploaded.

## Install

Extract directly into:

```text
C:\Users\tnkfi\AI Building\Scrap Helper
```

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"

Unblock-File ".\Tools\Setup-34-Offline-AI-Wiring.ps1"
& ".\Tools\Setup-34-Offline-AI-Wiring.ps1"
```

No trained production model is included.

# Scrap Helper Pack 29 — Recognition Architecture

This pack establishes the architecture needed before connecting a real on-device model.

## Added

- hierarchical entity types for whole objects, components, fittings, loose materials, mixed piles, and unknowns;
- neutral material and scrap-grade taxonomy;
- preparation conditions and hazard types;
- multiple detections with normalized bounding boxes;
- top candidates and confidence margins;
- evidence-source tracking;
- image-quality gating;
- adaptive clarification engine;
- one-question default budget;
- yard-specific category mapping from neutral grades;
- model name/version/taxonomy/checksum metadata;
- correction records and local JSONL correction logging;
- fixture recognition provider and orchestrator;
- unit tests for question suppression, targeted questions, image quality, and yard mapping.

## Question policy

Questions are exceptional, not routine. The engine asks only when a response can materially change material, grade, preparation, or safety. High-confidence bare bright copper produces no question. The default budget is one question.

## Install

Extract directly into:

```text
C:\Users\tnkfi\AI Building\Scrap Helper
```

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"
Unblock-File ".\Tools\Setup-29-Recognition-Architecture.ps1"
& ".\Tools\Setup-29-Recognition-Architecture.ps1"
```

Focused tests:

```powershell
cd ".\Flutter"
flutter test test\recognition --reporter expanded
```

This pack intentionally does not include a trained model. It freezes the contracts that future TFLite/LiteRT detector and specialist classifiers will implement.

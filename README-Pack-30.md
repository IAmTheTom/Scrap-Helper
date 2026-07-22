# Scrap Helper Pack 30 — On-Device Model Bridge

This pack creates the real local-model runtime layer without pretending a trained Scrap Helper model already exists.

## Added

- TFLite interpreter bridge using `tflite_flutter`;
- real PNG/JPEG decoding and EXIF-orientation handling;
- image resizing and RGB tensor construction;
- uint8 and float32 input support;
- zero-to-one and minus-one-to-one normalization;
- model-pack manifest contract;
- model name, version, taxonomy version, minimum app version, and SHA-256 metadata;
- model and label checksum validation;
- local model-pack installation into application-support storage;
- runtime input/output tensor inspection;
- classification execution entry point;
- tests using actual generated image pixels;
- model-pack checksum tests;
- example manifest.

## Honest limitation

No trained recognition model is included. Pack 30 makes the application capable of loading and running one entirely on-device once a valid `.tflite` model and labels are supplied.

## Install

Extract directly into:

```text
C:\Users\tnkfi\AI Building\Scrap Helper
```

Then run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"

Unblock-File ".\Tools\Setup-30-On-Device-Model-Bridge.ps1"
& ".\Tools\Setup-30-On-Device-Model-Bridge.ps1"
```

Focused tests:

```powershell
cd ".\Flutter"

flutter test `
  test\recognition\runtime `
  --reporter expanded
```

A valid future model pack must include:

```text
manifest.json
model.tflite
labels.txt
```

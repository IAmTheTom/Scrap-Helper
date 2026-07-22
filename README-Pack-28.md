# Scrap Helper Pack 28 — Local Image Input

This pack adds the first real photo workflow to Item Advisor.

## Added

- choose an image from the gallery/file picker;
- take a photo on Android or iOS;
- copy selected images into Scrap Helper application-support storage;
- preview, replace, and remove the local image;
- pass the local image path through the provider-neutral analysis request;
- simulated visual-provider support;
- deterministic fallback that never falsely claims it inspected image pixels;
- image request unit tests;
- an integration smoke test that avoids native picker automation.

## Privacy

No image is uploaded in this phase. Selected photos are copied into local Scrap Helper storage.

## Install

Extract directly into:

```text
C:\Users\tnkfi\AI Building\Scrap Helper
```

Run:

```powershell
cd "C:\Users\tnkfi\AI Building\Scrap Helper"

Unblock-File ".\Tools\Setup-28-Local-Image-Input.ps1"
& ".\Tools\Setup-28-Local-Image-Input.ps1"
```

Run the integration smoke test:

```powershell
cd ".\Flutter"

flutter test `
  integration_test\ai_image_input_test.dart `
  -d windows `
  --reporter expanded
```

View manually:

```powershell
flutter run -d windows
```

Open **Item Advisor** from the three-dot menu and choose a photo. Camera capture appears on Android/iOS; Windows uses file selection.

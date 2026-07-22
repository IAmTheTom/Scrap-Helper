$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

if (-not (Test-Path -LiteralPath (Join-Path $FlutterRoot "pubspec.yaml"))) {
    throw "Flutter project was not found at $FlutterRoot"
}

Push-Location $FlutterRoot
try {
    Write-Host "Adding image_picker..."
    flutter pub add image_picker
    if ($LASTEXITCODE -ne 0) { throw "Could not add image_picker." }

    dart format lib test integration_test
    if ($LASTEXITCODE -ne 0) { throw "dart format failed." }

    flutter analyze
    if ($LASTEXITCODE -ne 0) { throw "flutter analyze failed." }

    flutter test
    if ($LASTEXITCODE -ne 0) { throw "flutter test failed." }

    Write-Host ""
    Write-Host "Pack 28 installed successfully."
    Write-Host "Run:"
    Write-Host "flutter test integration_test\ai_image_input_test.dart -d windows --reporter expanded"
}
finally {
    Pop-Location
}

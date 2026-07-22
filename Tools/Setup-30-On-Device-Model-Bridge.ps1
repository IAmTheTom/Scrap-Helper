$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

if (-not (Test-Path -LiteralPath (Join-Path $FlutterRoot "pubspec.yaml"))) {
    throw "Flutter project was not found at $FlutterRoot"
}

Push-Location $FlutterRoot
try {
    Write-Host "Adding local inference dependencies..."

    flutter pub add image crypto tflite_flutter
    if ($LASTEXITCODE -ne 0) {
        throw "Could not add local inference dependencies."
    }

    dart format lib test integration_test
    if ($LASTEXITCODE -ne 0) { throw "dart format failed." }

    flutter analyze
    if ($LASTEXITCODE -ne 0) { throw "flutter analyze failed." }

    flutter test
    if ($LASTEXITCODE -ne 0) { throw "flutter test failed." }

    flutter test test\recognition\runtime --reporter expanded
    if ($LASTEXITCODE -ne 0) {
        throw "Local-model runtime tests failed."
    }

    Write-Host ""
    Write-Host "Pack 30 on-device model bridge installed successfully."
    Write-Host ""
    Write-Host "No trained model was installed."
    Write-Host "The app now has model-pack validation, real image pixel"
    Write-Host "preprocessing, and a TFLite interpreter bridge."
}
finally {
    Pop-Location
}

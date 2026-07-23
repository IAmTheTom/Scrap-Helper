$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

if (-not (Test-Path -LiteralPath (Join-Path $FlutterRoot "pubspec.yaml"))) {
    throw "Flutter project was not found at $FlutterRoot"
}

Push-Location $FlutterRoot

try {
    dart format lib test integration_test
    if ($LASTEXITCODE -ne 0) {
        throw "dart format failed."
    }

    flutter analyze
    if ($LASTEXITCODE -ne 0) {
        throw "flutter analyze failed."
    }

    flutter test
    if ($LASTEXITCODE -ne 0) {
        throw "flutter test failed."
    }

    flutter test `
        integration_test\offline_ai_wiring_test.dart `
        -d windows `
        --reporter expanded

    if ($LASTEXITCODE -ne 0) {
        throw "Offline AI wiring integration test failed."
    }

    Write-Host ""
    Write-Host "Pack 34 installed successfully."
    Write-Host ""
    Write-Host "Item Advisor now attempts a valid installed local"
    Write-Host "classification model before deterministic fallback."
}
finally {
    Pop-Location
}

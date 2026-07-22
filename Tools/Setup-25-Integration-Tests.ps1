$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

if (-not (Test-Path (Join-Path $FlutterRoot "pubspec.yaml"))) {
    throw "Flutter project not found at $FlutterRoot"
}

Push-Location $FlutterRoot
try {
    flutter pub add integration_test --dev --sdk=flutter
    if ($LASTEXITCODE -ne 0) { throw "Could not add integration_test." }

    dart format integration_test
    if ($LASTEXITCODE -ne 0) { throw "dart format failed." }

    flutter analyze
    if ($LASTEXITCODE -ne 0) { throw "flutter analyze failed." }

    flutter test
    if ($LASTEXITCODE -ne 0) { throw "flutter test failed." }

    Write-Host ""
    Write-Host "Pack 25 installed successfully."
    Write-Host "Run: & `"$ProjectRoot\Tools\Run-Integration-Tests.ps1`" -Device windows"
}
finally {
    Pop-Location
}

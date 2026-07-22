$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

if (-not (Test-Path -LiteralPath (Join-Path $FlutterRoot "pubspec.yaml"))) {
    throw "Flutter project was not found at $FlutterRoot"
}

Push-Location $FlutterRoot
try {
    dart format lib test integration_test
    if ($LASTEXITCODE -ne 0) { throw "dart format failed." }

    flutter analyze
    if ($LASTEXITCODE -ne 0) { throw "flutter analyze failed." }

    flutter test
    if ($LASTEXITCODE -ne 0) { throw "flutter test failed." }

    Write-Host ""
    Write-Host "Pack 26 installed successfully."
    Write-Host "Run all Windows integration tests with:"
    Write-Host "& `"$ProjectRoot\Tools\Run-Integration-Tests.ps1`" -Device windows"
}
finally {
    Pop-Location
}

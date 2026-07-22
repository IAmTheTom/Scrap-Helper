param([string]$IntegrationDevice = "windows")

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

Push-Location $FlutterRoot
try {
    dart format --output=none --set-exit-if-changed lib test integration_test
    if ($LASTEXITCODE -ne 0) { throw "Formatting check failed." }

    flutter analyze
    if ($LASTEXITCODE -ne 0) { throw "flutter analyze failed." }

    flutter test
    if ($LASTEXITCODE -ne 0) { throw "flutter test failed." }

    flutter test integration_test\app_workflows_test.dart -d $IntegrationDevice --reporter expanded
    if ($LASTEXITCODE -ne 0) { throw "Integration workflow failed." }

    Write-Host ""
    Write-Host "Full Scrap Helper validation passed."
}
finally {
    Pop-Location
}

param([string]$IntegrationDevice = "windows")

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

Push-Location $FlutterRoot
try {
    Write-Host "1/4 Checking formatting..."
    dart format --output=none --set-exit-if-changed lib test integration_test
    if ($LASTEXITCODE -ne 0) { throw "Formatting check failed." }

    Write-Host ""
    Write-Host "2/4 Running static analysis..."
    flutter analyze
    if ($LASTEXITCODE -ne 0) { throw "flutter analyze failed." }

    Write-Host ""
    Write-Host "3/4 Running unit and widget tests..."
    flutter test
    if ($LASTEXITCODE -ne 0) { throw "flutter test failed." }

    Write-Host ""
    Write-Host "4/4 Running all integration workflows on $IntegrationDevice..."
    flutter test integration_test -d $IntegrationDevice --reporter expanded
    if ($LASTEXITCODE -ne 0) { throw "Integration workflows failed." }

    Write-Host ""
    Write-Host "Full Scrap Helper validation passed."
}
finally {
    Pop-Location
}

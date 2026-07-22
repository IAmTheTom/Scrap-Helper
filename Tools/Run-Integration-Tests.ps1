param(
    [string]$Device = "windows",
    [string]$TestTarget = "integration_test"
)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

Push-Location $FlutterRoot
try {
    Write-Host "Running Scrap Helper integration suite..."
    Write-Host "Device: $Device"
    Write-Host "Target: $TestTarget"
    Write-Host ""

    flutter test $TestTarget -d $Device --reporter expanded

    if ($LASTEXITCODE -ne 0) {
        throw "Integration suite failed."
    }

    Write-Host ""
    Write-Host "Integration suite passed."
}
finally {
    Pop-Location
}

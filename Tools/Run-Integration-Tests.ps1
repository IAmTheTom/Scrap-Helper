param(
    [string]$Device = "windows",
    [string]$TestFile = "integration_test\app_workflows_test.dart"
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

Push-Location $FlutterRoot
try {
    flutter test $TestFile -d $Device --reporter expanded
    if ($LASTEXITCODE -ne 0) { throw "Integration test failed." }
    Write-Host ""
    Write-Host "Integration test passed."
}
finally {
    Pop-Location
}

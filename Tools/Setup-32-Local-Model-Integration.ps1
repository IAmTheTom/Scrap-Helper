$ErrorActionPreference="Stop"
$Root=Split-Path $PSScriptRoot -Parent
$Flutter=Join-Path $Root "Flutter"
Push-Location $Flutter
try {
  dart format lib test integration_test
  if ($LASTEXITCODE -ne 0) { throw "dart format failed." }
  flutter analyze
  if ($LASTEXITCODE -ne 0) { throw "flutter analyze failed." }
  flutter test
  if ($LASTEXITCODE -ne 0) { throw "flutter test failed." }
} finally {
  Pop-Location
}
Write-Host "Pack 32 installed. Local model import UI and output adapter are ready."

$ErrorActionPreference = "Stop"

$ProjectRoot = "C:\Users\tnkfi\AI Building\Scrap Helper"
$SetupScript = Join-Path $ProjectRoot "Tools\Setup-09-Database-Layer.ps1"

if (-not (Test-Path -LiteralPath $ProjectRoot)) {
    throw "Scrap Helper project not found: $ProjectRoot"
}

if (-not (Test-Path -LiteralPath (Join-Path $ProjectRoot "Flutter\pubspec.yaml"))) {
    throw "Flutter project not found under: $ProjectRoot\Flutter"
}

if (-not (Test-Path -LiteralPath $SetupScript)) {
    throw "Setup script not found: $SetupScript"
}

Push-Location $ProjectRoot
try {
    Unblock-File -LiteralPath $SetupScript
    & $SetupScript

    Write-Host ""
    Write-Host "Pack 09 completed. Current Git status:"
    git status --short
}
finally {
    Pop-Location
}

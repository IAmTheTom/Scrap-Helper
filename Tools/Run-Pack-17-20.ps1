$ErrorActionPreference = "Stop"

$ProjectRoot = "C:\Users\tnkfi\AI Building\Scrap Helper"
$SetupScript = Join-Path $ProjectRoot "Tools\Setup-17-20-Productivity-Dashboard.ps1"

if (-not (Test-Path -LiteralPath (Join-Path $ProjectRoot "Flutter\pubspec.yaml"))) {
    throw "Scrap Helper Flutter project was not found."
}

Push-Location $ProjectRoot
try {
    Unblock-File -LiteralPath $SetupScript
    & $SetupScript

    Write-Host ""
    Write-Host "Pack 17-20 completed. Current Git status:"
    git status --short
}
finally {
    Pop-Location
}

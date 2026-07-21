$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

Push-Location $FlutterRoot
try {
    flutter pub get
    flutter analyze
    flutter test
    flutter build windows --release

    $Output = Join-Path $FlutterRoot "build\windows\x64\runner\Release"
    if (-not (Test-Path -LiteralPath $Output)) {
        throw "Windows release output was not created."
    }

    Write-Host ""
    Write-Host "Windows release created:"
    Write-Host $Output
}
finally {
    Pop-Location
}

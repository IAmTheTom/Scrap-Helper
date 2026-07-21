$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

Push-Location $FlutterRoot
try {
    flutter pub get
    flutter analyze
    flutter test
    flutter build apk --release

    $Apk = Join-Path $FlutterRoot "build\app\outputs\flutter-apk\app-release.apk"
    if (-not (Test-Path -LiteralPath $Apk)) {
        throw "Release APK was not created."
    }

    Write-Host ""
    Write-Host "Android release APK created:"
    Write-Host $Apk
    Get-Item $Apk | Select-Object Length, FullName
}
finally {
    Pop-Location
}

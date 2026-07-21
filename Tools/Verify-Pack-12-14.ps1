$ErrorActionPreference = "Stop"

$FlutterRoot = "C:\Users\tnkfi\AI Building\Scrap Helper\Flutter"
Push-Location $FlutterRoot
try {
    dart format --output=none --set-exit-if-changed lib test
    flutter analyze
    flutter test
}
finally {
    Pop-Location
}

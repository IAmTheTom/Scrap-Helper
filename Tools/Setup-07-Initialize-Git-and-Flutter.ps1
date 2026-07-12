$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$FlutterRoot = Join-Path $ProjectRoot "Flutter"

Write-Host "Project root: $ProjectRoot"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git was not found in PATH."
}

if (-not (Test-Path (Join-Path $ProjectRoot ".git"))) {
    Push-Location $ProjectRoot
    try {
        git init
        if ($LASTEXITCODE -ne 0) { throw "git init failed." }
        Write-Host "Initialized Git repository."
    }
    finally {
        Pop-Location
    }
}
else {
    Write-Host "Git repository already exists."
}

$GitIgnore = @"
# Operating system
Thumbs.db
Desktop.ini
.DS_Store

# Editors
.vscode/
.idea/
*.iml

# Temporary project folders
Temp/
Backups/
Exports/
Imports/

# Flutter / Dart
Flutter/.dart_tool/
Flutter/.flutter-plugins
Flutter/.flutter-plugins-dependencies
Flutter/.packages
Flutter/build/
Flutter/coverage/
Flutter/android/.gradle/
Flutter/android/local.properties
Flutter/ios/Pods/
Flutter/ios/.symlinks/
Flutter/macos/Pods/
Flutter/windows/flutter/ephemeral/
Flutter/linux/flutter/ephemeral/
Flutter/macos/Flutter/ephemeral/

# Secrets and local environment
.env
.env.*
*.keystore
*.jks
key.properties
"@

[System.IO.File]::WriteAllText(
    (Join-Path $ProjectRoot ".gitignore"),
    $GitIgnore,
    (New-Object System.Text.UTF8Encoding($false))
)
Write-Host "Wrote .gitignore"

if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    Write-Warning "Flutter was not found in PATH. Git setup is complete, but Flutter project creation was skipped."
    Write-Host "Install or add Flutter to PATH, then rerun this script."
    exit 0
}

if (-not (Test-Path $FlutterRoot)) {
    New-Item -ItemType Directory -Force -Path $FlutterRoot | Out-Null
}

$PubspecPath = Join-Path $FlutterRoot "pubspec.yaml"

if (-not (Test-Path $PubspecPath)) {
    Push-Location $FlutterRoot
    try {
        flutter create --project-name scrap_helper --org com.tomfields .
        if ($LASTEXITCODE -ne 0) { throw "flutter create failed." }
        Write-Host "Created Flutter application."
    }
    finally {
        Pop-Location
    }
}
else {
    Write-Host "Flutter project already exists; creation skipped."
}

$AssetFolders = @(
    (Join-Path $FlutterRoot "assets\icons"),
    (Join-Path $FlutterRoot "assets\images"),
    (Join-Path $FlutterRoot "assets\seed_data")
)

foreach ($Folder in $AssetFolders) {
    New-Item -ItemType Directory -Force -Path $Folder | Out-Null
}

Push-Location $FlutterRoot
try {
    flutter pub get
    if ($LASTEXITCODE -ne 0) { throw "flutter pub get failed." }

    flutter analyze
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Flutter project was created, but flutter analyze reported issues."
    }

    flutter test
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Flutter project was created, but flutter test reported issues."
    }
}
finally {
    Pop-Location
}

Write-Host ""
Write-Host "Git and Flutter initialization completed."
Write-Host "Flutter path: $FlutterRoot"

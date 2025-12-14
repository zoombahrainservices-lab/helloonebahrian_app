# Quick Fix for Android Development Build Issue
# This script will build and install the development build so pressing 'a' works

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Fixing Android Development Build" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This will fix the 'No development build installed' error" -ForegroundColor Yellow
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "package.json")) {
    Write-Host "ERROR: Please run this from the mobile directory!" -ForegroundColor Red
    Write-Host "Usage: cd mobile; powershell -ExecutionPolicy Bypass -File ./FIX_ANDROID_NOW.ps1" -ForegroundColor White
    exit 1
}

# Step 1: Check if emulator is running
Write-Host "Step 1: Checking if Android emulator is running..." -ForegroundColor Yellow

$adbPath = $null
$possibleAdbPaths = @(
    "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    "$env:ProgramFiles\Android\Android Studio\platform-tools\adb.exe"
)

foreach ($path in $possibleAdbPaths) {
    if (Test-Path $path) {
        $adbPath = $path
        break
    }
}

if (-not $adbPath) {
    Write-Host "ERROR: ADB not found! Please add Android SDK to PATH." -ForegroundColor Red
    exit 1
}

$devices = & $adbPath devices 2>&1 | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }

if (-not $devices) {
    Write-Host "ERROR: No Android emulator is running!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "1. Start Android Studio" -ForegroundColor White
    Write-Host "2. Tools → Device Manager" -ForegroundColor White
    Write-Host "3. Start an emulator" -ForegroundColor White
    Write-Host "4. Wait for it to fully boot" -ForegroundColor White
    Write-Host "5. Run this script again" -ForegroundColor White
    exit 1
}

Write-Host "✓ Emulator is running" -ForegroundColor Green

# Step 2: Build and install development build
Write-Host ""
Write-Host "Step 2: Building and installing development build..." -ForegroundColor Yellow
Write-Host "This takes 10-15 minutes. Please wait..." -ForegroundColor Yellow
Write-Host ""

# Check if android folder exists, if not, prebuild first
if (-not (Test-Path "android")) {
    Write-Host "Generating Android native code..." -ForegroundColor Cyan
    npx expo prebuild --platform android --clean
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Prebuild failed!" -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Prebuild complete" -ForegroundColor Green
}

# Build and install
Write-Host ""
Write-Host "Building and installing APK on emulator..." -ForegroundColor Cyan
Write-Host "This may take 10-15 minutes. Please be patient..." -ForegroundColor Yellow
Write-Host ""

npx expo run:android

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ SUCCESS! Development build installed!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Now you can:" -ForegroundColor Cyan
    Write-Host "1. Run: npm start" -ForegroundColor White
    Write-Host "2. Press 'a' to open on Android" -ForegroundColor White
    Write-Host "3. Your app will open automatically!" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "Build failed. Common fixes:" -ForegroundColor Red
    Write-Host "- Make sure emulator is fully booted" -ForegroundColor Yellow
    Write-Host "- Try: npx expo run:android" -ForegroundColor Yellow
    Write-Host "- Check Java is installed: java -version" -ForegroundColor Yellow
    exit 1
}

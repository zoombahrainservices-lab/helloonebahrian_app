# Script to build and install development build locally
# This makes pressing 'a' work permanently!

Write-Host "Building Development Build Locally..." -ForegroundColor Cyan
Write-Host ""

# Check if Android Studio is set up
$adb = Get-Command adb -ErrorAction SilentlyContinue
if (-not $adb) {
    Write-Host "ADB not found. Android Studio needs to be configured." -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "1. Run: powershell -ExecutionPolicy Bypass -File ./fix-adb-now.ps1" -ForegroundColor White
    Write-Host "   (Run as Administrator)" -ForegroundColor White
    Write-Host "2. Restart terminal" -ForegroundColor White
    Write-Host "3. Run this script again" -ForegroundColor White
    Write-Host ""
    exit 1
}

Write-Host "Android Studio detected" -ForegroundColor Green
Write-Host ""

# Check if emulator is running
Write-Host "Checking for Android emulator..." -ForegroundColor Cyan
$devices = adb devices | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
if (-not $devices) {
    Write-Host "No emulator detected. Starting build anyway..." -ForegroundColor Yellow
    Write-Host "You can start emulator later and install the APK" -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "Step 1: Generating native Android code..." -ForegroundColor Cyan
npx expo prebuild --platform android --clean

if ($LASTEXITCODE -ne 0) {
    Write-Host "Prebuild failed. Check errors above." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Step 2: Building APK (this takes 5-10 minutes)..." -ForegroundColor Cyan
Write-Host "This is a one-time process. After this, pressing 'a' will work!" -ForegroundColor Yellow
Write-Host ""

npx expo run:android

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Build successful!" -ForegroundColor Green
    Write-Host "Development build installed on emulator!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Now you can:" -ForegroundColor Cyan
    Write-Host "1. Run: npm start" -ForegroundColor White
    Write-Host "2. Press 'a'" -ForegroundColor White
    Write-Host "3. Your app opens automatically!" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "Build failed. Check errors above." -ForegroundColor Red
    Write-Host "Make sure Android Studio is fully set up" -ForegroundColor Yellow
}

# Build Development Build NOW - Makes pressing 'a' work
# Run this after emulator is started

Write-Host "Building Development Build..." -ForegroundColor Cyan
Write-Host "This will make pressing 'a' work!" -ForegroundColor Yellow
Write-Host ""

# Check ADB
$adb = Get-Command adb -ErrorAction SilentlyContinue
if (-not $adb) {
    Write-Host "ERROR: ADB not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "1. Restart your terminal (or computer)" -ForegroundColor White
    Write-Host "2. Make sure you ran COMPLETE_FIX_ALL.ps1 as Administrator" -ForegroundColor White
    Write-Host "3. Try again" -ForegroundColor White
    exit 1
}

Write-Host "ADB found - good!" -ForegroundColor Green

# Check emulator
Write-Host "Checking for emulator..." -ForegroundColor Cyan
$devices = adb devices 2>&1 | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
if (-not $devices) {
    Write-Host "WARNING: No emulator detected!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "1. Open Android Studio" -ForegroundColor White
    Write-Host "2. Tools -> Device Manager" -ForegroundColor White
    Write-Host "3. Start an emulator" -ForegroundColor White
    Write-Host "4. Wait for it to boot" -ForegroundColor White
    Write-Host "5. Run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Or continue anyway (build will install when emulator starts)..." -ForegroundColor Yellow
    $continue = Read-Host "Continue? (y/n)"
    if ($continue -ne "y") {
        exit 1
    }
} else {
    Write-Host "Emulator detected - perfect!" -ForegroundColor Green
}

Write-Host ""
Write-Host "Starting build process..." -ForegroundColor Cyan
Write-Host "This takes 5-10 minutes. Please wait..." -ForegroundColor Yellow
Write-Host ""

# Step 1: Stop Gradle daemons and clean cache (fixes file lock errors)
Write-Host "Step 1: Stopping Gradle and cleaning cache..." -ForegroundColor Yellow

# Stop Gradle daemons first
if (Test-Path "android\gradlew.bat") {
    Push-Location android
    .\gradlew.bat --stop 2>&1 | Out-Null
    Pop-Location
}

# Kill any Java processes
Get-Process | Where-Object { $_.ProcessName -like "*java*" } | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1

# Clean Gradle cache
if (Test-Path "android\.gradle") {
    Remove-Item -Recurse -Force "android\.gradle" -ErrorAction SilentlyContinue
    Write-Host "Gradle cache cleaned" -ForegroundColor Green
}
if (Test-Path "android\app\build") {
    Remove-Item -Recurse -Force "android\app\build" -ErrorAction SilentlyContinue
    Write-Host "App build folder cleaned" -ForegroundColor Green
}

# Check for OneDrive warning
$onedriveProcess = Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue
if ($onedriveProcess) {
    Write-Host ""
    Write-Host "⚠️  WARNING: OneDrive is running!" -ForegroundColor Yellow
    Write-Host "   This can cause file locking errors." -ForegroundColor Yellow
    Write-Host "   Consider pausing OneDrive sync during build." -ForegroundColor Yellow
    Write-Host ""
}

# Step 2: Prebuild
Write-Host ""
Write-Host "Step 2: Generating native Android code..." -ForegroundColor Yellow
npx expo prebuild --platform android --clean

if ($LASTEXITCODE -ne 0) {
    Write-Host "Prebuild failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Try running: powershell -ExecutionPolicy Bypass -File ./FIX_EXPO_IMAGE_ERROR.ps1" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Step 3: Building and installing APK..." -ForegroundColor Yellow
Write-Host "This takes 5-10 minutes. Please wait..." -ForegroundColor Yellow
Write-Host ""

# Step 3: Build and install
npx expo run:android

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "SUCCESS! Development build installed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Now you can:" -ForegroundColor Cyan
    Write-Host "1. Run: npm start" -ForegroundColor White
    Write-Host "2. Press 'a'" -ForegroundColor White
    Write-Host "3. Your app opens automatically!" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "Build failed. Check errors above." -ForegroundColor Red
    Write-Host ""
    Write-Host "Common fixes:" -ForegroundColor Yellow
    Write-Host "- Make sure emulator is running" -ForegroundColor White
    Write-Host "- Make sure Android Studio is fully installed" -ForegroundColor White
    Write-Host "- Try: npx expo prebuild --platform android --clean" -ForegroundColor White
}



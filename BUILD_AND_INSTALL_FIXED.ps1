# PERMANENT SOLUTION: Build and Install Development Build
# This script handles OneDrive path issues and builds/installs the app properly

Write-Host "Build and Install Development Build" -ForegroundColor Green
Write-Host "This will build and install the app on your emulator." -ForegroundColor Yellow
Write-Host ""

# Set shorter paths for Gradle (OneDrive fix)
$env:GRADLE_USER_HOME = "C:\gradle-cache"
$env:GRADLE_OPTS = "-Duser.home=C:\gradle-home -Dorg.gradle.daemon=false -Dorg.gradle.parallel=false -Dfile.encoding=UTF-8"

# Navigate to mobile directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

# Check if emulator is running
Write-Host "Checking Android emulator..." -ForegroundColor Yellow
$devices = adb devices 2>&1
if ($devices -notmatch "emulator" -and $devices -notmatch "device") {
    Write-Host "No Android emulator or device found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "1. Start your Android emulator in Android Studio" -ForegroundColor White
    Write-Host "   OR" -ForegroundColor White
    Write-Host "2. Connect a physical Android device via USB" -ForegroundColor White
    Write-Host ""
    Write-Host "Then run this script again." -ForegroundColor Yellow
    exit 1
}
Write-Host "Android device/emulator found!" -ForegroundColor Green
Write-Host ""

# Clean old builds
Write-Host "Cleaning old build artifacts..." -ForegroundColor Yellow
if (Test-Path "android\.gradle") {
    Remove-Item -Recurse -Force "android\.gradle" -ErrorAction SilentlyContinue
}
if (Test-Path "android\app\build") {
    Remove-Item -Recurse -Force "android\app\build" -ErrorAction SilentlyContinue
}
Write-Host "Cleaned!" -ForegroundColor Green
Write-Host ""

# Build and install using Expo
Write-Host "Building development build (this takes 5-10 minutes)..." -ForegroundColor Yellow
Write-Host "This will:" -ForegroundColor Gray
Write-Host "  1. Generate native Android project" -ForegroundColor Gray
Write-Host "  2. Build the APK" -ForegroundColor Gray
Write-Host "  3. Install on emulator" -ForegroundColor Gray
Write-Host "  4. Start Metro bundler" -ForegroundColor Gray
Write-Host ""

try {
    # Use expo run:android which handles everything
    npx expo run:android --no-build-cache
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "SUCCESS! Development build installed!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Your app should now be running on the emulator!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next time, you can just run:" -ForegroundColor Cyan
        Write-Host "   cd mobile" -ForegroundColor White
        Write-Host "   npx expo start" -ForegroundColor White
        Write-Host "   Then press 'a' to open on Android" -ForegroundColor White
    } else {
        Write-Host ""
        Write-Host "Build failed. Error code: $LASTEXITCODE" -ForegroundColor Red
        Write-Host ""
        Write-Host "PERMANENT FIX OPTIONS:" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Option 1: Move project out of OneDrive (BEST)" -ForegroundColor Cyan
        Write-Host "   Run the MOVE_PROJECT_FIX.ps1 script" -ForegroundColor White
        Write-Host "   This moves project to C:\dev\ to avoid path issues forever" -ForegroundColor Gray
        Write-Host ""
        Write-Host "Option 2: Use Expo Go (FASTEST)" -ForegroundColor Cyan
        Write-Host "   1. Install Expo Go app on your phone" -ForegroundColor White
        Write-Host "   2. Run: npx expo start" -ForegroundColor White
        Write-Host "   3. Scan QR code with Expo Go" -ForegroundColor White
        Write-Host ""
        Write-Host "Option 3: Use Web Browser" -ForegroundColor Cyan
        Write-Host "   Run: npx expo start" -ForegroundColor White
        Write-Host "   Then press 'w' for web" -ForegroundColor White
    }
} catch {
    Write-Host ""
    Write-Host "Build error occurred" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    Write-Host "Try moving project out of OneDrive:" -ForegroundColor Yellow
    Write-Host "   Run the MOVE_PROJECT_FIX.ps1 script" -ForegroundColor Cyan
}




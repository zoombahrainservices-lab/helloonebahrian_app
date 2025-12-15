# Build Development Build for Android
# This fixes the "No development build" error

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  BUILDING DEVELOPMENT BUILD" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if Android emulator is running
Write-Host "Checking for Android emulator..." -ForegroundColor Yellow
$emulatorRunning = adb devices 2>&1 | Select-String -Pattern "emulator" -Quiet

if ($emulatorRunning) {
    Write-Host "✅ Android emulator detected!" -ForegroundColor Green
} else {
    Write-Host "⚠️  No emulator detected. Make sure your Android emulator is running." -ForegroundColor Yellow
    Write-Host "   Or connect a physical Android device via USB." -ForegroundColor Gray
    Write-Host ""
    $continue = Read-Host "Continue anyway? (y/n)"
    if ($continue -ne "y") {
        Write-Host "Build cancelled." -ForegroundColor Red
        exit
    }
}

Write-Host ""
Write-Host "Building development build..." -ForegroundColor Cyan
Write-Host "This will take 5-10 minutes. Please wait..." -ForegroundColor Yellow
Write-Host ""

# Set environment variables to avoid OneDrive path issues
$env:GRADLE_USER_HOME = "C:\gradle-cache"
$env:GRADLE_OPTS = "-Duser.home=C:\gradle-home -Dorg.gradle.daemon=false -Dorg.gradle.parallel=false -Dfile.encoding=UTF-8"

# Build the development build
npx expo run:android

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  BUILD COMPLETE!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "If build succeeded:" -ForegroundColor Cyan
Write-Host "  - The app should automatically install on your device" -ForegroundColor White
Write-Host "  - You can now run: npm start" -ForegroundColor White
Write-Host "  - Then press 'a' to open on Android" -ForegroundColor White
Write-Host ""




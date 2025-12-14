# Fix expo-image Gradle Build Error
# This fixes the "Process 'command 'node'' finished with non-zero exit value 1" error

Write-Host "Fixing expo-image Gradle build error..." -ForegroundColor Cyan
Write-Host ""

# Step 1: Clean Gradle cache
Write-Host "Step 1: Cleaning Gradle cache..." -ForegroundColor Yellow
if (Test-Path "android\.gradle") {
    Remove-Item -Recurse -Force "android\.gradle" -ErrorAction SilentlyContinue
    Write-Host "Gradle cache cleaned" -ForegroundColor Green
}

if (Test-Path "android\app\build") {
    Remove-Item -Recurse -Force "android\app\build" -ErrorAction SilentlyContinue
    Write-Host "App build folder cleaned" -ForegroundColor Green
}

# Step 2: Verify Node.js is available
Write-Host ""
Write-Host "Step 2: Verifying Node.js..." -ForegroundColor Yellow
$nodePath = Get-Command node -ErrorAction SilentlyContinue
if (-not $nodePath) {
    Write-Host "ERROR: Node.js not found in PATH!" -ForegroundColor Red
    Write-Host "Please add Node.js to your PATH" -ForegroundColor Yellow
    exit 1
}

Write-Host "Node.js found: $($nodePath.Path)" -ForegroundColor Green
Write-Host "Node version: $(node --version)" -ForegroundColor Green

# Step 3: Clean node_modules and reinstall
Write-Host ""
Write-Host "Step 3: Reinstalling dependencies..." -ForegroundColor Yellow
Write-Host "This ensures expo-image is properly installed" -ForegroundColor Gray

Remove-Item -Recurse -Force node_modules\expo-image -ErrorAction SilentlyContinue
npm install expo-image@~1.13.0 --save

if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to reinstall expo-image" -ForegroundColor Red
    exit 1
}

Write-Host "expo-image reinstalled" -ForegroundColor Green

# Step 4: Clean prebuild and rebuild
Write-Host ""
Write-Host "Step 4: Cleaning and rebuilding Android project..." -ForegroundColor Yellow
Write-Host "This will regenerate the Android project" -ForegroundColor Gray

if (Test-Path "android") {
    Remove-Item -Recurse -Force "android" -ErrorAction SilentlyContinue
    Write-Host "Android folder removed" -ForegroundColor Green
}

Write-Host ""
Write-Host "Running prebuild..." -ForegroundColor Cyan
npx expo prebuild --platform android --clean

if ($LASTEXITCODE -ne 0) {
    Write-Host "Prebuild failed!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Prebuild successful!" -ForegroundColor Green
Write-Host ""
Write-Host "Now try building again:" -ForegroundColor Cyan
Write-Host "npm run android:build" -ForegroundColor White
Write-Host ""
Write-Host "Or run directly:" -ForegroundColor Cyan
Write-Host "npx expo run:android" -ForegroundColor White



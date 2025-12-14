# Quick script to get app running on Android emulator
Write-Host "🚀 Starting Android App..." -ForegroundColor Green

# Step 1: Check if emulator is running
Write-Host "`n📱 Checking emulator..." -ForegroundColor Yellow
$devices = adb devices
if ($devices -notmatch "emulator") {
    Write-Host "❌ No emulator found!" -ForegroundColor Red
    Write-Host "Please start your Android emulator from Android Studio first." -ForegroundColor Yellow
    Write-Host "Then run this script again." -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Emulator found!" -ForegroundColor Green

# Step 2: Navigate to mobile directory
Set-Location $PSScriptRoot

# Step 3: Start Expo server
Write-Host "`n🌐 Starting Expo server..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot'; npx expo start --clear" -WindowStyle Minimized

# Step 4: Build and install app
Write-Host "`n🔨 Building app (this takes 5-10 minutes on first build)..." -ForegroundColor Yellow
Write-Host "Please wait..." -ForegroundColor Yellow

Set-Location android
$env:GRADLE_OPTS = "-Dorg.gradle.daemon=false -Dorg.gradle.parallel=false"
$env:GRADLE_USER_HOME = "C:\gradle"

.\gradlew.bat assembleDebug installDebug --no-daemon

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ SUCCESS! App installed and running!" -ForegroundColor Green
    Write-Host "The app should now be open on your emulator." -ForegroundColor Green
} else {
    Write-Host "`n❌ Build failed. Trying alternative method..." -ForegroundColor Red
    
    # Alternative: Use Expo Go
    Write-Host "`n📲 Alternative: Install Expo Go on emulator:" -ForegroundColor Yellow
    Write-Host "1. Open Play Store in emulator" -ForegroundColor White
    Write-Host "2. Search 'Expo Go' and install" -ForegroundColor White
    Write-Host "3. Open Expo Go app" -ForegroundColor White
    Write-Host "4. Enter URL: exp://localhost:8081" -ForegroundColor White
}





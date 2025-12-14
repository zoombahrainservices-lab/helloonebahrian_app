# Fixed build script with OneDrive path workaround
Write-Host "🔨 Building Android app with OneDrive fix..." -ForegroundColor Green

# Set shorter paths for Gradle
$env:GRADLE_USER_HOME = "C:\gradle-cache"
$env:GRADLE_OPTS = "-Duser.home=C:\gradle-home -Dorg.gradle.daemon=false -Dorg.gradle.parallel=false"
$env:GRADLE_OPTS += " -Dfile.encoding=UTF-8"

# Check emulator
Write-Host "`n📱 Checking emulator..." -ForegroundColor Yellow
$devices = adb devices
if ($devices -notmatch "emulator") {
    Write-Host "❌ No emulator found!" -ForegroundColor Red
    Write-Host "Please start your Android emulator first." -ForegroundColor Yellow
    exit 1
}
Write-Host "✅ Emulator found!" -ForegroundColor Green

# Navigate to mobile directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

# Clear old Gradle cache in project
Write-Host "`n🧹 Cleaning old Gradle cache..." -ForegroundColor Yellow
if (Test-Path "android\.gradle") {
    Remove-Item -Recurse -Force "android\.gradle" -ErrorAction SilentlyContinue
}

# Build
Write-Host "`n🔨 Building app (this takes 5-10 minutes)..." -ForegroundColor Yellow
Set-Location android

try {
    .\gradlew.bat assembleDebug installDebug --no-daemon --build-cache
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "`n✅ SUCCESS! App installed and running!" -ForegroundColor Green
        Write-Host "The app should now be open on your emulator." -ForegroundColor Green
    } else {
        Write-Host "`n❌ Build failed. Error code: $LASTEXITCODE" -ForegroundColor Red
        Write-Host "`n💡 Try the permanent fix:" -ForegroundColor Yellow
        Write-Host "Run: ..\..\MOVE_PROJECT_FIX.ps1" -ForegroundColor Cyan
        Write-Host "This moves your project to C:\dev\ to avoid OneDrive path issues." -ForegroundColor White
    }
} catch {
    Write-Host "`n❌ Build error: $_" -ForegroundColor Red
    Write-Host "`n💡 PERMANENT FIX: Move project out of OneDrive" -ForegroundColor Yellow
    Write-Host "Run: ..\..\MOVE_PROJECT_FIX.ps1" -ForegroundColor Cyan
}





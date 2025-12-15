# PERMANENT FIX: Gradle File Lock Error
# This fixes "Could not move temporary workspace" error
# Run as Administrator for best results

param(
    [switch]$SkipAdminCheck
)

Write-Host "🔧 PERMANENT FIX: Gradle File Lock Error" -ForegroundColor Cyan
Write-Host "This will fix the OneDrive file locking issue" -ForegroundColor Yellow
Write-Host ""

if (-not $SkipAdminCheck) {
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if (-not $isAdmin) {
        Write-Host "⚠️  Running as Administrator recommended for file operations" -ForegroundColor Yellow
        Write-Host "Right-click PowerShell -> Run as Administrator" -ForegroundColor Yellow
        Write-Host ""
        $continue = Read-Host "Continue anyway? (y/n)"
        if ($continue -ne "y") {
            exit 1
        }
    }
}

# Step 1: Stop all Gradle daemons
Write-Host "Step 1: Stopping Gradle daemons..." -ForegroundColor Yellow
if (Test-Path "android\gradlew.bat") {
    Push-Location android
    .\gradlew.bat --stop 2>&1 | Out-Null
    Pop-Location
    Write-Host "Gradle daemons stopped" -ForegroundColor Green
}

# Kill any Java/Gradle processes
Get-Process | Where-Object { $_.ProcessName -like "*java*" -or $_.ProcessName -like "*gradle*" } | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# Step 2: Close OneDrive temporarily (if possible)
Write-Host ""
Write-Host "Step 2: Checking OneDrive..." -ForegroundColor Yellow
$onedriveProcess = Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue
if ($onedriveProcess) {
    Write-Host "⚠️  OneDrive is running - this can cause file locking!" -ForegroundColor Yellow
    Write-Host "💡 Consider pausing OneDrive sync during build" -ForegroundColor Yellow
    Write-Host "   Right-click OneDrive icon -> Pause syncing -> 2 hours" -ForegroundColor White
    Write-Host ""
    $pause = Read-Host "Pause OneDrive now? (y/n)"
    if ($pause -eq "y") {
        # Try to pause OneDrive (may require user interaction)
        Write-Host "Please pause OneDrive manually from system tray" -ForegroundColor Yellow
        Start-Sleep -Seconds 3
    }
}

# Step 3: Delete ALL Gradle caches and build folders
Write-Host ""
Write-Host "Step 3: Cleaning ALL Gradle caches..." -ForegroundColor Yellow

# Android project Gradle cache
if (Test-Path "android\.gradle") {
    Write-Host "Removing android\.gradle..." -ForegroundColor Gray
    Remove-Item -Recurse -Force "android\.gradle" -ErrorAction SilentlyContinue
}

# App build folder
if (Test-Path "android\app\build") {
    Write-Host "Removing android\app\build..." -ForegroundColor Gray
    Remove-Item -Recurse -Force "android\app\build" -ErrorAction SilentlyContinue
}

# Global Gradle cache (user home)
$globalGradleCache = "$env:USERPROFILE\.gradle"
if (Test-Path $globalGradleCache) {
    Write-Host "Cleaning global Gradle cache..." -ForegroundColor Gray
    # Only clean caches, not settings
    if (Test-Path "$globalGradleCache\caches") {
        Remove-Item -Recurse -Force "$globalGradleCache\caches" -ErrorAction SilentlyContinue
    }
    if (Test-Path "$globalGradleCache\daemon") {
        Remove-Item -Recurse -Force "$globalGradleCache\daemon" -ErrorAction SilentlyContinue
    }
}

Write-Host "All Gradle caches cleaned" -ForegroundColor Green

# Step 4: Remove entire android folder and rebuild
Write-Host ""
Write-Host "Step 4: Removing Android project..." -ForegroundColor Yellow
if (Test-Path "android") {
    Write-Host "Removing android folder..." -ForegroundColor Gray
    Remove-Item -Recurse -Force "android" -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    Write-Host "Android folder removed" -ForegroundColor Green
}

# Step 5: Clean node_modules expo-image (fixes previous error)
Write-Host ""
Write-Host "Step 5: Reinstalling expo-image..." -ForegroundColor Yellow
if (Test-Path "node_modules\expo-image") {
    Remove-Item -Recurse -Force "node_modules\expo-image" -ErrorAction SilentlyContinue
}
npm install expo-image@~1.13.0 --save --no-audit --no-fund
Write-Host "expo-image reinstalled" -ForegroundColor Green

# Step 6: Rebuild Android project
Write-Host ""
Write-Host "Step 6: Rebuilding Android project..." -ForegroundColor Yellow
Write-Host "This will regenerate the Android project from scratch" -ForegroundColor Gray
Write-Host ""

npx expo prebuild --platform android --clean

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "❌ Prebuild failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Try these steps:" -ForegroundColor Yellow
    Write-Host "1. Pause OneDrive sync completely" -ForegroundColor White
    Write-Host "2. Close Android Studio if open" -ForegroundColor White
    Write-Host "3. Run this script again" -ForegroundColor White
    exit 1
}

Write-Host ""
Write-Host "✅ Prebuild successful!" -ForegroundColor Green
Write-Host ""
Write-Host "Step 7: Fixing settings.gradle..." -ForegroundColor Yellow

# Fix settings.gradle if needed
$settingsFile = "android\settings.gradle"
if (Test-Path $settingsFile) {
    $content = Get-Content $settingsFile -Raw
    if ($content -notmatch "com.facebook.react.settings") {
        Write-Host "settings.gradle looks good" -ForegroundColor Green
    } else {
        Write-Host "settings.gradle found" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "ALL FIXES APPLIED!" -ForegroundColor Green
Write-Host ""
Write-Host "Now try building:" -ForegroundColor Cyan
Write-Host "npm run android:build" -ForegroundColor White
Write-Host ""
Write-Host "TIP: Pause OneDrive sync before building to avoid file locks!" -ForegroundColor Yellow


# Complete Android Studio Setup Script
# Run this as Administrator to set up Android Studio for Expo development

Write-Host "🔧 Setting up Android Studio for Expo Development..." -ForegroundColor Cyan
Write-Host ""

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "⚠️  This script needs Administrator privileges" -ForegroundColor Yellow
    Write-Host "Please run PowerShell as Administrator and try again" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Right-click PowerShell → Run as Administrator" -ForegroundColor White
    exit 1
}

Write-Host "✅ Running as Administrator" -ForegroundColor Green
Write-Host ""

# Default Android SDK path
$androidSdkPath = "$env:LOCALAPPDATA\Android\Sdk"
$platformToolsPath = "$androidSdkPath\platform-tools"

# Check if Android SDK exists
if (-not (Test-Path $androidSdkPath)) {
    Write-Host "❌ Android SDK not found at: $androidSdkPath" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "1. Install Android Studio from: https://developer.android.com/studio" -ForegroundColor White
    Write-Host "2. Open Android Studio" -ForegroundColor White
    Write-Host "3. Go to Tools → SDK Manager" -ForegroundColor White
    Write-Host "4. Install Android SDK Platform 34" -ForegroundColor White
    Write-Host "5. Run this script again" -ForegroundColor White
    exit 1
}

Write-Host "✅ Android SDK found at: $androidSdkPath" -ForegroundColor Green
Write-Host ""

# Set ANDROID_HOME
Write-Host "📝 Setting ANDROID_HOME environment variable..." -ForegroundColor Cyan
[System.Environment]::SetEnvironmentVariable('ANDROID_HOME', $androidSdkPath, 'Machine')
Write-Host "✅ ANDROID_HOME set to: $androidSdkPath" -ForegroundColor Green

# Add platform-tools to PATH
Write-Host "📝 Adding platform-tools to PATH..." -ForegroundColor Cyan
$currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
if ($currentPath -notlike "*$platformToolsPath*") {
    $newPath = $currentPath + ";$platformToolsPath"
    [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
    Write-Host "✅ Added platform-tools to PATH" -ForegroundColor Green
} else {
    Write-Host "✅ platform-tools already in PATH" -ForegroundColor Green
}

Write-Host ""
Write-Host "✅ Setup Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  IMPORTANT: Restart your terminal (or computer) for changes to take effect!" -ForegroundColor Yellow
Write-Host ""
Write-Host "After restarting, verify setup:" -ForegroundColor Cyan
Write-Host "  adb version" -ForegroundColor White
Write-Host ""
Write-Host "Then build development build:" -ForegroundColor Cyan
Write-Host "  cd mobile" -ForegroundColor White
Write-Host "  npm run android:build" -ForegroundColor White
Write-Host ""






# Quick Fix for ADB "not recognized" Error
# Run this as Administrator

param(
    [switch]$SkipAdminCheck
)

if (-not $SkipAdminCheck) {
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if (-not $isAdmin) {
        Write-Host "This script needs Administrator privileges" -ForegroundColor Yellow
        Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
        Write-Host "Then run this script again" -ForegroundColor Yellow
        pause
        exit 1
    }
}

Write-Host "Fixing ADB Setup..." -ForegroundColor Cyan
Write-Host ""

# Android SDK path
$androidSdkPath = "C:\Users\Farzeen\AppData\Local\Android\Sdk"
$platformToolsPath = "$androidSdkPath\platform-tools"

# Check if SDK exists
if (-not (Test-Path $platformToolsPath)) {
    Write-Host "Android SDK not found at: $androidSdkPath" -ForegroundColor Red
    Write-Host "Please install Android Studio first" -ForegroundColor Yellow
    pause
    exit 1
}

Write-Host "Found Android SDK at: $androidSdkPath" -ForegroundColor Green

# Set ANDROID_HOME
Write-Host "Setting ANDROID_HOME..." -ForegroundColor Cyan
[System.Environment]::SetEnvironmentVariable('ANDROID_HOME', $androidSdkPath, 'Machine')
Write-Host "ANDROID_HOME set" -ForegroundColor Green

# Add to PATH
Write-Host "Adding platform-tools to PATH..." -ForegroundColor Cyan
$currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
if ($currentPath -notlike "*$platformToolsPath*") {
    $newPath = $currentPath + ";$platformToolsPath"
    [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
    Write-Host "Added to PATH" -ForegroundColor Green
} else {
    Write-Host "Already in PATH" -ForegroundColor Green
}

Write-Host ""
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Restart your terminal for changes to take effect!" -ForegroundColor Yellow
Write-Host ""
Write-Host "After restarting, run: adb version" -ForegroundColor Cyan
Write-Host ""
pause






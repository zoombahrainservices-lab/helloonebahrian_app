# Complete Fix - Sets up everything and makes Android app work
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

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Complete Android Setup & Fix" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Fix ADB
Write-Host "Step 1: Setting up ADB..." -ForegroundColor Yellow
$androidSdkPath = "C:\Users\Farzeen\AppData\Local\Android\Sdk"
$platformToolsPath = "$androidSdkPath\platform-tools"

if (Test-Path "$platformToolsPath\adb.exe") {
    Write-Host "Found Android SDK at: $androidSdkPath" -ForegroundColor Green
    
    # Set ANDROID_HOME
    [System.Environment]::SetEnvironmentVariable('ANDROID_HOME', $androidSdkPath, 'Machine')
    Write-Host "ANDROID_HOME set" -ForegroundColor Green
    
    # Add to PATH
    $currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
    if ($currentPath -notlike "*$platformToolsPath*") {
        $newPath = $currentPath + ";$platformToolsPath"
        [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
        Write-Host "Added ADB to PATH" -ForegroundColor Green
    } else {
        Write-Host "ADB already in PATH" -ForegroundColor Green
    }
} else {
    Write-Host "Android SDK not found. Please install Android Studio first." -ForegroundColor Red
    Write-Host "Download from: https://developer.android.com/studio" -ForegroundColor Yellow
    pause
    exit 1
}

# Set JAVA_HOME
Write-Host ""
Write-Host "Step 2: Setting up Java..." -ForegroundColor Yellow
$javaPaths = @(
    "C:\Program Files\Android\Android Studio\jbr",
    "C:\Program Files\Android\Android Studio\jre",
    "$env:ProgramFiles\Android\Android Studio\jbr"
)

$javaHome = $null
foreach ($path in $javaPaths) {
    if (Test-Path "$path\bin\java.exe") {
        $javaHome = $path
        Write-Host "Found Java at: $path" -ForegroundColor Green
        break
    }
}

if ($javaHome) {
    [System.Environment]::SetEnvironmentVariable('JAVA_HOME', $javaHome, 'Machine')
    Write-Host "JAVA_HOME set" -ForegroundColor Green
    
    # Add to PATH
    $currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
    $javaBinPath = "$javaHome\bin"
    if ($currentPath -notlike "*$javaBinPath*") {
        $newPath = $currentPath + ";$javaBinPath"
        [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
        Write-Host "Java added to PATH" -ForegroundColor Green
    }
} else {
    Write-Host "Java not found - build may fail" -ForegroundColor Yellow
    Write-Host "Install Android Studio or Java JDK" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Step 3: Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Restart your terminal for changes to take effect!" -ForegroundColor Yellow
Write-Host ""
Write-Host "After restarting terminal:" -ForegroundColor Cyan
Write-Host "1. Test: adb version" -ForegroundColor White
Write-Host "2. Start Android emulator" -ForegroundColor White
Write-Host "3. Run: cd mobile" -ForegroundColor White
Write-Host "4. Run: npm run android:build" -ForegroundColor White
Write-Host ""
Write-Host "This will build the development build (5-10 min, one time)" -ForegroundColor Yellow
Write-Host "After that, pressing 'a' will work forever!" -ForegroundColor Green
Write-Host ""
pause




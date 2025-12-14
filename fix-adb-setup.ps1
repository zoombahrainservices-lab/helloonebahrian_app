# Fix ADB "not recognized" Error
# This script sets up Android Studio and ADB properly

Write-Host "🔧 Fixing ADB Setup..." -ForegroundColor Cyan
Write-Host ""

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "⚠️  This script needs Administrator privileges" -ForegroundColor Yellow
    Write-Host "Please run PowerShell as Administrator:" -ForegroundColor Yellow
    Write-Host "1. Right-click PowerShell" -ForegroundColor White
    Write-Host "2. Select 'Run as Administrator'" -ForegroundColor White
    Write-Host "3. Run this script again" -ForegroundColor White
    Write-Host ""
    pause
    exit 1
}

Write-Host "✅ Running as Administrator" -ForegroundColor Green
Write-Host ""

# Find Android SDK
Write-Host "🔍 Looking for Android SDK..." -ForegroundColor Cyan
$sdkPaths = @(
    "$env:LOCALAPPDATA\Android\Sdk",
    "$env:USERPROFILE\AppData\Local\Android\Sdk",
    "C:\Android\Sdk",
    "$env:ProgramFiles\Android\Android Studio\sdk"
)

$androidSdkPath = $null
foreach ($path in $sdkPaths) {
    if (Test-Path "$path\platform-tools\adb.exe") {
        $androidSdkPath = $path
        Write-Host "✅ Found Android SDK at: $path" -ForegroundColor Green
        break
    }
}

if (-not $androidSdkPath) {
    Write-Host "❌ Android SDK not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Android Studio:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://developer.android.com/studio" -ForegroundColor White
    Write-Host "2. Install with default settings" -ForegroundColor White
    Write-Host "3. Open Android Studio" -ForegroundColor White
    Write-Host "4. Go to Tools → SDK Manager" -ForegroundColor White
    Write-Host "5. Install 'Android SDK Platform-Tools'" -ForegroundColor White
    Write-Host "6. Run this script again" -ForegroundColor White
    Write-Host ""
    pause
    exit 1
}

$platformToolsPath = "$androidSdkPath\platform-tools"

# Set ANDROID_HOME
Write-Host ""
Write-Host "📝 Setting ANDROID_HOME..." -ForegroundColor Cyan
try {
    [System.Environment]::SetEnvironmentVariable('ANDROID_HOME', $androidSdkPath, 'Machine')
    Write-Host "✅ ANDROID_HOME set to: $androidSdkPath" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to set ANDROID_HOME: $_" -ForegroundColor Red
    pause
    exit 1
}

# Add to PATH
Write-Host ""
Write-Host "📝 Adding platform-tools to PATH..." -ForegroundColor Cyan
try {
    $currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
    
    if ($currentPath -notlike "*$platformToolsPath*") {
        $newPath = $currentPath + ";$platformToolsPath"
        [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
        Write-Host "✅ Added platform-tools to PATH" -ForegroundColor Green
    } else {
        Write-Host "✅ platform-tools already in PATH" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ Failed to update PATH: $_" -ForegroundColor Red
    pause
    exit 1
}

# Also set JAVA_HOME if Android Studio is installed
$javaPaths = @(
    "C:\Program Files\Android\Android Studio\jbr",
    "C:\Program Files\Android\Android Studio\jre",
    "$env:ProgramFiles\Android\Android Studio\jbr"
)

foreach ($javaPath in $javaPaths) {
    if (Test-Path $javaPath) {
        try {
            [System.Environment]::SetEnvironmentVariable('JAVA_HOME', $javaPath, 'Machine')
            Write-Host "✅ JAVA_HOME set to: $javaPath" -ForegroundColor Green
            break
        } catch {
            # Ignore if can't set
        }
    }
}

Write-Host ""
Write-Host "✅ Setup Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  IMPORTANT: You MUST restart your terminal for changes to take effect!" -ForegroundColor Yellow
Write-Host ""
Write-Host "After restarting terminal, verify setup:" -ForegroundColor Cyan
Write-Host "  adb version" -ForegroundColor White
Write-Host ""
Write-Host "If it shows ADB version, setup is successful!" -ForegroundColor Green
Write-Host ""
pause






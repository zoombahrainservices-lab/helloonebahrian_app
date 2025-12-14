# Fix JAVA_HOME Error - Run as Administrator

param(
    [switch]$SkipAdminCheck
)

if (-not $SkipAdminCheck) {
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if (-not $isAdmin) {
        Write-Host "This script needs Administrator privileges" -ForegroundColor Yellow
        Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
        pause
        exit 1
    }
}

Write-Host "Fixing JAVA_HOME..." -ForegroundColor Cyan
Write-Host ""

# Find Java in Android Studio
$javaPaths = @(
    "C:\Program Files\Android\Android Studio\jbr",
    "C:\Program Files\Android\Android Studio\jre",
    "$env:ProgramFiles\Android\Android Studio\jbr",
    "C:\Program Files (x86)\Android\Android Studio\jbr"
)

$javaHome = $null
foreach ($path in $javaPaths) {
    if (Test-Path "$path\bin\java.exe") {
        $javaHome = $path
        Write-Host "Found Java at: $path" -ForegroundColor Green
        break
    }
}

if (-not $javaHome) {
    Write-Host "Java not found in Android Studio!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "1. Make sure Android Studio is installed" -ForegroundColor White
    Write-Host "2. Or install Java JDK from: https://adoptium.net/" -ForegroundColor White
    Write-Host "3. Then run this script again" -ForegroundColor White
    pause
    exit 1
}

# Set JAVA_HOME
Write-Host "Setting JAVA_HOME to: $javaHome" -ForegroundColor Cyan
[System.Environment]::SetEnvironmentVariable('JAVA_HOME', $javaHome, 'Machine')
Write-Host "JAVA_HOME set successfully!" -ForegroundColor Green

# Also add to PATH if not already there
$currentPath = [System.Environment]::GetEnvironmentVariable('Path', 'Machine')
$javaBinPath = "$javaHome\bin"
if ($currentPath -notlike "*$javaBinPath*") {
    $newPath = $currentPath + ";$javaBinPath"
    [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')
    Write-Host "Added Java to PATH" -ForegroundColor Green
} else {
    Write-Host "Java already in PATH" -ForegroundColor Green
}

Write-Host ""
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Restart your terminal for changes to take effect!" -ForegroundColor Yellow
Write-Host ""
Write-Host "After restarting, run: npm run android:build" -ForegroundColor Cyan
Write-Host ""
pause




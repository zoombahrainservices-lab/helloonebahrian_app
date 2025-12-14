# Script to open app in Android emulator using Expo Go
# This script automatically detects and opens Expo Go in the emulator

Write-Host "Checking for Android emulator..." -ForegroundColor Cyan

# Check if adb is available
$adbPath = Get-Command adb -ErrorAction SilentlyContinue
if (-not $adbPath) {
    Write-Host "ADB not found. Make sure Android Studio is installed." -ForegroundColor Red
    Write-Host "Alternative: Install Expo Go in emulator manually" -ForegroundColor Yellow
    exit 1
}

# Check if emulator is running
$devices = adb devices | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
if (-not $devices) {
    Write-Host "No Android emulator detected. Please start an emulator first." -ForegroundColor Red
    Write-Host "Start emulator from Android Studio: Tools -> Device Manager -> Start" -ForegroundColor Yellow
    exit 1
}

Write-Host "Android emulator detected" -ForegroundColor Green

# Check if Expo Go is installed
Write-Host "Checking for Expo Go..." -ForegroundColor Cyan
$expoGoInstalled = adb shell pm list packages | Select-String "host.exp.exponent"
if (-not $expoGoInstalled) {
    Write-Host "Expo Go not found in emulator" -ForegroundColor Yellow
    Write-Host "Installing Expo Go..." -ForegroundColor Cyan
    
    # Download Expo Go APK
    $apkUrl = "https://d1ahtucjixef4r.cloudfront.net/Exponent-2.28.9.apk"
    $apkPath = "$env:TEMP\ExpoGo.apk"
    
    try {
        Invoke-WebRequest -Uri $apkUrl -OutFile $apkPath
        Write-Host "Downloaded Expo Go APK" -ForegroundColor Green
        
        # Install APK
        adb install $apkPath
        Write-Host "Expo Go installed successfully!" -ForegroundColor Green
        Remove-Item $apkPath -ErrorAction SilentlyContinue
    } catch {
        Write-Host "Failed to install Expo Go automatically" -ForegroundColor Red
        Write-Host "Please install Expo Go manually from Play Store in the emulator" -ForegroundColor Yellow
        exit 1
    }
} else {
    Write-Host "Expo Go is already installed" -ForegroundColor Green
}

# Get the Expo dev server URL
Write-Host "Getting Expo dev server URL..." -ForegroundColor Cyan

# Try to get URL from environment or use default
$expoUrl = $env:EXPO_DEV_SERVER_URL
if (-not $expoUrl) {
    # Get local IP address
    $ipAddress = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "127.*" -and $_.IPAddress -notlike "169.254.*" } | Select-Object -First 1).IPAddress
    if (-not $ipAddress) {
        $ipAddress = "localhost"
    }
    $expoUrl = "exp://${ipAddress}:8081"
}

Write-Host "Opening Expo Go with URL: $expoUrl" -ForegroundColor Cyan

# Open Expo Go with the URL
adb shell am start -a android.intent.action.VIEW -d "$expoUrl" host.exp.exponent

Write-Host "Expo Go should open in the emulator!" -ForegroundColor Green
Write-Host "If it doesn't open automatically, enter this URL manually in Expo Go:" -ForegroundColor Yellow
Write-Host "$expoUrl" -ForegroundColor White

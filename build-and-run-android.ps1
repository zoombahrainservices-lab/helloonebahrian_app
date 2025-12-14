# Complete Android Build and Run Script
# This script will:
# 1. Start the Android emulator
# 2. Wait for it to be ready
# 3. Build and install the development build
# 4. Start Expo and open the app

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Android Development Build Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Check if emulator exists
Write-Host "Step 1: Checking emulator configuration..." -ForegroundColor Yellow
$emulatorPath = "$env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe"
if (-not (Test-Path $emulatorPath)) {
    Write-Host "ERROR: Android emulator not found at: $emulatorPath" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Android Studio and set up an emulator:" -ForegroundColor Yellow
    Write-Host "1. Open Android Studio" -ForegroundColor White
    Write-Host "2. Tools -> Device Manager" -ForegroundColor White
    Write-Host "3. Create a new device (e.g., Medium_Phone_API_36.1)" -ForegroundColor White
    Write-Host "4. Run this script again" -ForegroundColor White
    exit 1
}

Write-Host "Emulator found: $emulatorPath" -ForegroundColor Green

# Step 2: List available emulators
Write-Host ""
Write-Host "Step 2: Checking available emulators..." -ForegroundColor Yellow
$emulatorList = & "$emulatorPath" -list-avds 2>&1
if ($LASTEXITCODE -ne 0 -or -not $emulatorList) {
    Write-Host "ERROR: No emulators found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please create an emulator in Android Studio:" -ForegroundColor Yellow
    Write-Host "1. Open Android Studio" -ForegroundColor White
    Write-Host "2. Tools -> Device Manager" -ForegroundColor White
    Write-Host "3. Click 'Create Device'" -ForegroundColor White
    Write-Host "4. Choose a device (e.g., Pixel 5)" -ForegroundColor White
    Write-Host "5. Download a system image (API 33 or higher)" -ForegroundColor White
    Write-Host "6. Finish setup" -ForegroundColor White
    exit 1
}

Write-Host "Available emulators:" -ForegroundColor Green
$emulatorList | ForEach-Object { Write-Host "  - $_" -ForegroundColor White }

# Step 3: Select or use default emulator
$defaultEmulator = "Medium_Phone_API_36.1"
$selectedEmulator = $defaultEmulator

# Check if default exists
$emulatorExists = $emulatorList -contains $defaultEmulator
if (-not $emulatorExists) {
    Write-Host ""
    Write-Host "Default emulator '$defaultEmulator' not found." -ForegroundColor Yellow
    $firstEmulator = ($emulatorList | Select-Object -First 1).Trim()
    if ($firstEmulator) {
        $selectedEmulator = $firstEmulator
        Write-Host "Using first available emulator: $selectedEmulator" -ForegroundColor Yellow
    } else {
        Write-Host "ERROR: No emulators available!" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host ""
    Write-Host "Using emulator: $selectedEmulator" -ForegroundColor Green
}

# Step 4: Check if emulator is already running
Write-Host ""
Write-Host "Step 3: Checking if emulator is running..." -ForegroundColor Yellow
$adb = Get-Command adb -ErrorAction SilentlyContinue
if (-not $adb) {
    Write-Host "ERROR: ADB not found in PATH!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please add Android SDK platform-tools to PATH:" -ForegroundColor Yellow
    Write-Host "1. Open System Environment Variables" -ForegroundColor White
    Write-Host "2. Add: $env:LOCALAPPDATA\Android\Sdk\platform-tools" -ForegroundColor White
    Write-Host "3. Restart terminal and try again" -ForegroundColor White
    exit 1
}

$runningDevices = adb devices 2>&1 | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
if ($runningDevices) {
    Write-Host "Emulator is already running!" -ForegroundColor Green
    $emulatorRunning = $true
} else {
    Write-Host "Emulator is not running. Starting it now..." -ForegroundColor Yellow
    Write-Host "This may take 1-2 minutes. Please wait..." -ForegroundColor Yellow
    Write-Host ""
    
    # Start emulator in background
    $emulatorProcess = Start-Process -FilePath $emulatorPath -ArgumentList "-avd", $selectedEmulator -PassThru -NoNewWindow
    
    # Wait for emulator to boot
    $maxWaitTime = 180 # 3 minutes
    $waitInterval = 5 # Check every 5 seconds
    $elapsed = 0
    $emulatorReady = $false
    
    Write-Host "Waiting for emulator to boot..." -ForegroundColor Cyan
    while ($elapsed -lt $maxWaitTime) {
        Start-Sleep -Seconds $waitInterval
        $elapsed += $waitInterval
        
        $devices = adb devices 2>&1 | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
        if ($devices) {
            Write-Host "Emulator is ready!" -ForegroundColor Green
            $emulatorReady = $true
            break
        }
        
        # Show progress
        $dots = "." * (($elapsed / $waitInterval) % 4)
        Write-Host "Still booting$dots" -NoNewline
        Write-Host "`r" -NoNewline
    }
    
    if (-not $emulatorReady) {
        Write-Host ""
        Write-Host "ERROR: Emulator took too long to start!" -ForegroundColor Red
        Write-Host ""
        Write-Host "Try starting it manually:" -ForegroundColor Yellow
        Write-Host "  $emulatorPath -avd $selectedEmulator" -ForegroundColor White
        Write-Host ""
        Write-Host "Or start it from Android Studio: Tools -> Device Manager" -ForegroundColor Yellow
        exit 1
    }
    
    $emulatorRunning = $true
}

# Step 5: Build and install development build
if ($emulatorRunning) {
    Write-Host ""
    Write-Host "Step 4: Building and installing development build..." -ForegroundColor Yellow
    Write-Host "This takes 5-10 minutes. Please wait..." -ForegroundColor Yellow
    Write-Host ""
    
    # Stop any existing Gradle daemons
    if (Test-Path "android\gradlew.bat") {
        Push-Location android
        .\gradlew.bat --stop 2>&1 | Out-Null
        Pop-Location
    }
    
    # Clean build folders
    if (Test-Path "android\app\build") {
        Remove-Item -Recurse -Force "android\app\build" -ErrorAction SilentlyContinue
    }
    
    # Prebuild
    Write-Host "Generating native Android code..." -ForegroundColor Cyan
    npx expo prebuild --platform android --clean
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Prebuild failed!" -ForegroundColor Red
        exit 1
    }
    
    # Build and install
    Write-Host ""
    Write-Host "Building and installing APK..." -ForegroundColor Cyan
    npx expo run:android
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "SUCCESS! Development build installed!" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Cyan
        Write-Host "1. Run: npm start" -ForegroundColor White
        Write-Host "2. Press 'a' to open on Android" -ForegroundColor White
        Write-Host "3. Your app should open automatically!" -ForegroundColor White
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "Build failed. Check errors above." -ForegroundColor Red
        Write-Host ""
        Write-Host "Common fixes:" -ForegroundColor Yellow
        Write-Host "- Make sure emulator is fully booted" -ForegroundColor White
        Write-Host "- Make sure Android Studio SDK is properly installed" -ForegroundColor White
        Write-Host "- Try: npx expo prebuild --platform android --clean" -ForegroundColor White
        exit 1
    }
}

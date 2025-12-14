# Complete Android Build and Run Script
# This script will:
# 1. Start the Android emulator
# 2. Wait for it to be ready
# 3. Build and install the development build
# 4. Start Expo and open the app

# Set error action preference
$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Android Development Build Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "package.json")) {
    Write-Host "ERROR: package.json not found!" -ForegroundColor Red
    Write-Host "Please run this script from the mobile directory." -ForegroundColor Yellow
    Write-Host "Current directory: $(Get-Location)" -ForegroundColor Yellow
    exit 1
}

# Check if node_modules exists
if (-not (Test-Path "node_modules")) {
    Write-Host "WARNING: node_modules not found!" -ForegroundColor Yellow
    Write-Host "Installing dependencies first..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Failed to install dependencies!" -ForegroundColor Red
        exit 1
    }
}

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
try {
    $emulatorListOutput = & "$emulatorPath" -list-avds 2>&1
    $emulatorList = @()
    foreach ($line in $emulatorListOutput) {
        $trimmed = $line.ToString().Trim()
        if ($trimmed -and -not $trimmed.StartsWith("PANIC:")) {
            $emulatorList += $trimmed
        }
    }
    
    if ($emulatorList.Count -eq 0) {
        throw "No emulators found"
    }
} catch {
    Write-Host "ERROR: Failed to list emulators!" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
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

# Check if default exists (case-insensitive comparison)
$emulatorExists = $false
foreach ($emu in $emulatorList) {
    if ($emu -eq $defaultEmulator) {
        $emulatorExists = $true
        break
    }
}

if (-not $emulatorExists) {
    Write-Host ""
    Write-Host "Default emulator '$defaultEmulator' not found." -ForegroundColor Yellow
    if ($emulatorList.Count -gt 0) {
        $selectedEmulator = $emulatorList[0]
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

# Try to find ADB in common locations
$adbPath = $null
$possibleAdbPaths = @(
    "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe",
    "$env:ProgramFiles\Android\Android Studio\platform-tools\adb.exe",
    "$env:ANDROID_HOME\platform-tools\adb.exe"
)

# First try Get-Command
$adb = Get-Command adb -ErrorAction SilentlyContinue
if ($adb) {
    $adbPath = $adb.Source
} else {
    # Try common paths
    foreach ($path in $possibleAdbPaths) {
        if (Test-Path $path) {
            $adbPath = $path
            break
        }
    }
}

if (-not $adbPath) {
    Write-Host "ERROR: ADB not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please add Android SDK platform-tools to PATH:" -ForegroundColor Yellow
    Write-Host "1. Open System Environment Variables" -ForegroundColor White
    Write-Host "2. Add: $env:LOCALAPPDATA\Android\Sdk\platform-tools" -ForegroundColor White
    Write-Host "3. Restart terminal and try again" -ForegroundColor White
    Write-Host ""
    Write-Host "Or set ANDROID_HOME environment variable to your Android SDK path" -ForegroundColor Yellow
    exit 1
}

Write-Host "ADB found: $adbPath" -ForegroundColor Green

# Use full path to adb
$runningDevices = & $adbPath devices 2>&1 | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
if ($runningDevices) {
    Write-Host "Emulator is already running!" -ForegroundColor Green
    $emulatorRunning = $true
} else {
    Write-Host "Emulator is not running. Starting it now..." -ForegroundColor Yellow
    Write-Host "This may take 1-2 minutes. Please wait..." -ForegroundColor Yellow
    Write-Host ""
    
    # Start emulator in background (use WindowStyle Hidden instead of NoNewWindow)
    try {
        $emulatorProcess = Start-Process -FilePath $emulatorPath -ArgumentList "-avd", $selectedEmulator -PassThru -WindowStyle Hidden
        if (-not $emulatorProcess) {
            throw "Failed to start emulator process"
        }
        Write-Host "Emulator process started (PID: $($emulatorProcess.Id))" -ForegroundColor Cyan
    } catch {
        Write-Host "ERROR: Failed to start emulator!" -ForegroundColor Red
        Write-Host "Error: $_" -ForegroundColor Red
        Write-Host ""
        Write-Host "Try starting it manually:" -ForegroundColor Yellow
        Write-Host "  $emulatorPath -avd $selectedEmulator" -ForegroundColor White
        exit 1
    }
    
    # Wait for emulator to boot
    $maxWaitTime = 180 # 3 minutes
    $waitInterval = 5 # Check every 5 seconds
    $elapsed = 0
    $emulatorReady = $false
    
    Write-Host "Waiting for emulator to boot..." -ForegroundColor Cyan
    $progressCounter = 0
    while ($elapsed -lt $maxWaitTime) {
        Start-Sleep -Seconds $waitInterval
        $elapsed += $waitInterval
        
        # Check if process is still running
        if ($emulatorProcess -and $emulatorProcess.HasExited) {
            if ($emulatorProcess.ExitCode -ne 0) {
                Write-Host ""
                Write-Host "ERROR: Emulator process exited with code $($emulatorProcess.ExitCode)!" -ForegroundColor Red
                Write-Host "The emulator may have crashed. Check Android Studio for details." -ForegroundColor Yellow
                exit 1
            }
        }
        
        try {
            $devicesOutput = & $adbPath devices 2>&1
            $devices = $devicesOutput | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
            if ($devices) {
                Write-Host ""
                Write-Host "Emulator is ready!" -ForegroundColor Green
                $emulatorReady = $true
                break
            }
        } catch {
            # ADB might not be ready yet, continue waiting
        }
        
        # Show progress
        $progressCounter++
        $dots = "." * (($progressCounter % 4) + 1)
        Write-Host "Still booting$dots ($elapsed/$maxWaitTime seconds)" -NoNewline
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
    $prebuildResult = & npx expo prebuild --platform android --clean 2>&1
    $prebuildExitCode = $LASTEXITCODE
    
    if ($prebuildExitCode -ne 0) {
        Write-Host "Prebuild failed!" -ForegroundColor Red
        Write-Host "Output: $prebuildResult" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Try running manually:" -ForegroundColor Yellow
        Write-Host "  npx expo prebuild --platform android --clean" -ForegroundColor White
        exit 1
    }
    
    # Build and install
    Write-Host ""
    Write-Host "Building and installing APK..." -ForegroundColor Cyan
    Write-Host "This may take several minutes. Please be patient..." -ForegroundColor Yellow
    $buildResult = & npx expo run:android 2>&1
    $buildExitCode = $LASTEXITCODE
    
    if ($buildExitCode -eq 0) {
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


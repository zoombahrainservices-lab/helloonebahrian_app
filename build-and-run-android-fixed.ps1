# Complete Android Build and Run Script - Fixed Version
# This script will:
# 1. Start the Android emulator
# 2. Wait for it to be ready
# 3. Build and install the development build
# 4. Start Expo and open the app

# Set error action preference
$ErrorActionPreference = "Continue"
$PSDefaultParameterValues['*:ErrorAction'] = 'Continue'

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Android Development Build Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if we're in the right directory
if (-not (Test-Path "package.json")) {
    Write-Host "ERROR: package.json not found!" -ForegroundColor Red
    Write-Host "Please run this script from the mobile directory." -ForegroundColor Yellow
    Write-Host "Current directory: $(Get-Location)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Usage: cd mobile; powershell -ExecutionPolicy Bypass -File ./build-and-run-android-fixed.ps1" -ForegroundColor White
    exit 1
}

Write-Host "✓ Running from correct directory" -ForegroundColor Green

# Check if node_modules exists
if (-not (Test-Path "node_modules")) {
    Write-Host ""
    Write-Host "WARNING: node_modules not found!" -ForegroundColor Yellow
    Write-Host "Installing dependencies first..." -ForegroundColor Yellow
    & npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Failed to install dependencies!" -ForegroundColor Red
        Write-Host "Please run 'npm install' manually and fix any errors." -ForegroundColor Yellow
        exit 1
    }
    Write-Host "✓ Dependencies installed" -ForegroundColor Green
}

# Step 1: Check if emulator exists
Write-Host ""
Write-Host "Step 1: Checking emulator configuration..." -ForegroundColor Yellow
$emulatorPath = Join-Path $env:LOCALAPPDATA "Android\Sdk\emulator\emulator.exe"

# Also check Program Files location
if (-not (Test-Path $emulatorPath)) {
    $emulatorPath = Join-Path $env:ProgramFiles "Android\Android Studio\emulator\emulator.exe"
}

if (-not (Test-Path $emulatorPath)) {
    Write-Host "ERROR: Android emulator not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Searched locations:" -ForegroundColor Yellow
    Write-Host "  - $env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe" -ForegroundColor White
    Write-Host "  - $env:ProgramFiles\Android\Android Studio\emulator\emulator.exe" -ForegroundColor White
    Write-Host ""
    Write-Host "Please install Android Studio and set up an emulator:" -ForegroundColor Yellow
    Write-Host "1. Download and install Android Studio" -ForegroundColor White
    Write-Host "2. Open Android Studio → Tools → Device Manager" -ForegroundColor White
    Write-Host "3. Click 'Create Device'" -ForegroundColor White
    Write-Host "4. Choose a device (e.g., Pixel 5)" -ForegroundColor White
    Write-Host "5. Download a system image (API 33 or higher)" -ForegroundColor White
    Write-Host "6. Finish setup and run this script again" -ForegroundColor White
    exit 1
}

Write-Host "✓ Emulator found: $emulatorPath" -ForegroundColor Green

# Step 2: List available emulators
Write-Host ""
Write-Host "Step 2: Checking available emulators..." -ForegroundColor Yellow

$emulatorList = @()
try {
    $emulatorListOutput = & $emulatorPath -list-avds 2>&1
    $outputString = $emulatorListOutput | Out-String
    
    if ($LASTEXITCODE -eq 0 -and $outputString) {
        $lines = $outputString -split "`r?`n" | Where-Object { $_.Trim() -ne "" }
        foreach ($line in $lines) {
            $trimmed = $line.Trim()
            if ($trimmed -and -not $trimmed.StartsWith("PANIC:") -and -not $trimmed.StartsWith("ERROR:")) {
                $emulatorList += $trimmed
            }
        }
    }
} catch {
    Write-Host "Warning: Could not list emulators: $_" -ForegroundColor Yellow
}

if ($emulatorList.Count -eq 0) {
    Write-Host "ERROR: No emulators found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please create an emulator in Android Studio:" -ForegroundColor Yellow
    Write-Host "1. Open Android Studio" -ForegroundColor White
    Write-Host "2. Tools → Device Manager" -ForegroundColor White
    Write-Host "3. Click 'Create Device'" -ForegroundColor White
    Write-Host "4. Choose a device (e.g., Pixel 5)" -ForegroundColor White
    Write-Host "5. Download a system image (API 33 or higher)" -ForegroundColor White
    Write-Host "6. Finish setup" -ForegroundColor White
    exit 1
}

Write-Host "✓ Available emulators:" -ForegroundColor Green
$emulatorList | ForEach-Object { Write-Host "    - $_" -ForegroundColor White }

# Step 3: Select or use default emulator
$defaultEmulator = "Medium_Phone_API_36.1"
$selectedEmulator = $defaultEmulator

# Check if default exists
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
    Write-Host "✓ Using emulator: $selectedEmulator" -ForegroundColor Green
}

# Step 4: Check if emulator is already running
Write-Host ""
Write-Host "Step 3: Checking if emulator is running..." -ForegroundColor Yellow

# Try to find ADB in common locations
$adbPath = $null
$possibleAdbPaths = @(
    Join-Path $env:LOCALAPPDATA "Android\Sdk\platform-tools\adb.exe",
    Join-Path $env:ProgramFiles "Android\Android Studio\platform-tools\adb.exe"
)

# First try Get-Command
try {
    $adb = Get-Command adb -ErrorAction SilentlyContinue
    if ($adb) {
        $adbPath = $adb.Source
    }
} catch {
    # Continue to try paths
}

# Try common paths
if (-not $adbPath) {
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
    Write-Host "1. Open System Properties → Environment Variables" -ForegroundColor White
    Write-Host "2. Edit PATH variable" -ForegroundColor White
    Write-Host "3. Add: $env:LOCALAPPDATA\Android\Sdk\platform-tools" -ForegroundColor White
    Write-Host "4. Restart terminal and try again" -ForegroundColor White
    Write-Host ""
    Write-Host "Or set ANDROID_HOME environment variable" -ForegroundColor Yellow
    exit 1
}

Write-Host "✓ ADB found: $adbPath" -ForegroundColor Green

# Check for running devices
$runningDevices = @()
try {
    $devicesOutput = & $adbPath devices 2>&1
    $runningDevices = $devicesOutput | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
} catch {
    Write-Host "Warning: Could not check devices: $_" -ForegroundColor Yellow
}

if ($runningDevices) {
    Write-Host "✓ Emulator is already running!" -ForegroundColor Green
    $emulatorRunning = $true
} else {
    Write-Host "Emulator is not running. Starting it now..." -ForegroundColor Yellow
    Write-Host "This may take 1-3 minutes. Please wait..." -ForegroundColor Yellow
    Write-Host ""
    
    # Start emulator
    $emulatorProcess = $null
    try {
        # Try with WindowStyle Hidden first
        $emulatorProcess = Start-Process -FilePath $emulatorPath -ArgumentList "-avd", $selectedEmulator -PassThru -WindowStyle Hidden -ErrorAction Stop
        Write-Host "✓ Emulator process started (PID: $($emulatorProcess.Id))" -ForegroundColor Cyan
    } catch {
        # Fallback: try without WindowStyle
        try {
            Write-Host "Trying alternative method..." -ForegroundColor Yellow
            $emulatorProcess = Start-Process -FilePath $emulatorPath -ArgumentList "-avd", $selectedEmulator -PassThru -ErrorAction Stop
            Write-Host "✓ Emulator process started (PID: $($emulatorProcess.Id))" -ForegroundColor Cyan
        } catch {
            Write-Host "ERROR: Failed to start emulator!" -ForegroundColor Red
            Write-Host "Error: $_" -ForegroundColor Red
            Write-Host ""
            Write-Host "Try starting it manually:" -ForegroundColor Yellow
            Write-Host "  $emulatorPath -avd $selectedEmulator" -ForegroundColor White
            Write-Host ""
            Write-Host "Or start it from Android Studio: Tools → Device Manager" -ForegroundColor Yellow
            exit 1
        }
    }
    
    # Wait for emulator to boot
    $maxWaitTime = 240 # 4 minutes
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
                Write-Host "The emulator may have crashed." -ForegroundColor Yellow
                Write-Host ""
                Write-Host "Common causes:" -ForegroundColor Yellow
                Write-Host "- Insufficient RAM (need at least 2GB for emulator)" -ForegroundColor White
                Write-Host "- Hardware acceleration not enabled" -ForegroundColor White
                Write-Host "- Emulator configuration issue" -ForegroundColor White
                Write-Host ""
                Write-Host "Try starting it manually from Android Studio first." -ForegroundColor Yellow
                exit 1
            }
        }
        
        # Check if device is ready
        try {
            $devicesOutput = & $adbPath devices 2>&1
            $devices = $devicesOutput | Select-Object -Skip 1 | Where-Object { $_ -match "device$" }
            if ($devices) {
                Write-Host ""
                Write-Host "✓ Emulator is ready!" -ForegroundColor Green
                $emulatorReady = $true
                break
            }
        } catch {
            # ADB might not be ready yet, continue waiting
        }
        
        # Show progress
        $progressCounter++
        $dots = "." * (($progressCounter % 4) + 1)
        $percent = [math]::Round(($elapsed / $maxWaitTime) * 100)
        Write-Host "Still booting$dots ($elapsed/$maxWaitTime seconds - $percent%)" -NoNewline
        Write-Host "`r" -NoNewline
    }
    
    Write-Host "" # New line after progress
    
    if (-not $emulatorReady) {
        Write-Host "ERROR: Emulator took too long to start!" -ForegroundColor Red
        Write-Host ""
        Write-Host "The emulator may still be starting. You can:" -ForegroundColor Yellow
        Write-Host "1. Wait a bit longer and check manually: adb devices" -ForegroundColor White
        Write-Host "2. Start it manually: $emulatorPath -avd $selectedEmulator" -ForegroundColor White
        Write-Host "3. Start it from Android Studio: Tools → Device Manager" -ForegroundColor White
        Write-Host ""
        Write-Host "Once the emulator is running, you can continue with:" -ForegroundColor Yellow
        Write-Host "  npx expo run:android" -ForegroundColor White
        exit 1
    }
    
    $emulatorRunning = $true
}

# Step 5: Build and install development build
if ($emulatorRunning) {
    Write-Host ""
    Write-Host "Step 4: Building and installing development build..." -ForegroundColor Yellow
    Write-Host "This takes 5-15 minutes. Please wait..." -ForegroundColor Yellow
    Write-Host ""
    
    # Stop any existing Gradle daemons
    if (Test-Path "android\gradlew.bat") {
        Write-Host "Stopping Gradle daemons..." -ForegroundColor Cyan
        Push-Location android
        & .\gradlew.bat --stop 2>&1 | Out-Null
        Pop-Location
    }
    
    # Clean build folders (optional, but helps with issues)
    if (Test-Path "android\app\build") {
        Write-Host "Cleaning previous build..." -ForegroundColor Cyan
        Remove-Item -Recurse -Force "android\app\build" -ErrorAction SilentlyContinue
    }
    
    # Prebuild
    Write-Host ""
    Write-Host "Generating native Android code..." -ForegroundColor Cyan
    $prebuildSuccess = $false
    try {
        & npx expo prebuild --platform android --clean 2>&1 | Tee-Object -Variable prebuildResult
        $prebuildExitCode = $LASTEXITCODE
        
        if ($prebuildExitCode -eq 0) {
            $prebuildSuccess = $true
            Write-Host "✓ Prebuild successful" -ForegroundColor Green
        } else {
            Write-Host "Prebuild failed with exit code: $prebuildExitCode" -ForegroundColor Red
            Write-Host "Output:" -ForegroundColor Yellow
            $prebuildResult | ForEach-Object { Write-Host $_ -ForegroundColor White }
        }
    } catch {
        Write-Host "Prebuild error: $_" -ForegroundColor Red
    }
    
    if (-not $prebuildSuccess) {
        Write-Host ""
        Write-Host "Prebuild failed! Try running manually:" -ForegroundColor Yellow
        Write-Host "  npx expo prebuild --platform android --clean" -ForegroundColor White
        Write-Host ""
        Write-Host "Common fixes:" -ForegroundColor Yellow
        Write-Host "- Delete android folder and try again" -ForegroundColor White
        Write-Host "- Check for file permission issues" -ForegroundColor White
        Write-Host "- Pause OneDrive sync if project is in OneDrive" -ForegroundColor White
        exit 1
    }
    
    # Build and install
    Write-Host ""
    Write-Host "Building and installing APK..." -ForegroundColor Cyan
    Write-Host "This may take 10-15 minutes. Please be patient..." -ForegroundColor Yellow
    Write-Host ""
    
    $buildSuccess = $false
    try {
        # Run build and capture output
        & npx expo run:android 2>&1
        $buildExitCode = $LASTEXITCODE
        
        if ($buildExitCode -eq 0) {
            $buildSuccess = $true
        }
    } catch {
        Write-Host "Build error: $_" -ForegroundColor Red
        $buildExitCode = 1
    }
    
    if ($buildSuccess) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "✓ SUCCESS! Development build installed!" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Cyan
        Write-Host "1. Run: npm start" -ForegroundColor White
        Write-Host "2. Press 'a' to open on Android" -ForegroundColor White
        Write-Host "3. Your app should open automatically!" -ForegroundColor White
        Write-Host ""
    } else {
        Write-Host ""
        Write-Host "Build failed with exit code: $buildExitCode" -ForegroundColor Red
        Write-Host ""
        Write-Host "Common fixes:" -ForegroundColor Yellow
        Write-Host "- Make sure emulator is fully booted (wait for home screen)" -ForegroundColor White
        Write-Host "- Check Java installation: java -version" -ForegroundColor White
        Write-Host "- Clean and rebuild: Remove android folder, run prebuild again" -ForegroundColor White
        Write-Host "- Check Gradle logs in: android\.gradle" -ForegroundColor White
        Write-Host ""
        Write-Host "Try building manually:" -ForegroundColor Yellow
        Write-Host "  npx expo run:android" -ForegroundColor White
        exit 1
    }
} else {
    Write-Host ""
    Write-Host "ERROR: Emulator is not running!" -ForegroundColor Red
    exit 1
}

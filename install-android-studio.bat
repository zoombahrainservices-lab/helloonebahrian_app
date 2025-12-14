@echo off
echo ========================================
echo Android Studio Installation Helper
echo ========================================
echo.

echo Step 1: Opening Android Studio download page...
start https://developer.android.com/studio

echo.
echo Please download and install Android Studio from the browser that just opened.
echo.
echo After installation, run this script again to set up environment variables.
echo.
pause

echo.
echo Step 2: Setting up environment variables...
echo.

REM Check if ANDROID_HOME already exists
setx ANDROID_HOME "C:\Users\Farzeen\AppData\Local\Android\Sdk" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ ANDROID_HOME set successfully!
) else (
    echo ⚠️  Could not set ANDROID_HOME automatically.
    echo Please set it manually:
    echo    Variable name: ANDROID_HOME
    echo    Variable value: C:\Users\Farzeen\AppData\Local\Android\Sdk
)

echo.
echo Step 3: Adding to PATH...
echo.

REM Add platform-tools to PATH
setx PATH "%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\tools" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ PATH updated successfully!
) else (
    echo ⚠️  Could not update PATH automatically.
    echo Please add these manually to PATH:
    echo    %ANDROID_HOME%\platform-tools
    echo    %ANDROID_HOME%\tools
)

echo.
echo ========================================
echo IMPORTANT: Restart your computer now!
echo ========================================
echo.
echo After restart:
echo 1. Open Android Studio
echo 2. Go to Tools ^> Device Manager
echo 3. Create a new Virtual Device
echo 4. Run: npm start
echo 5. Press 'a' to open Android emulator
echo.
pause







echo ========================================
echo Android Studio Installation Helper
echo ========================================
echo.

echo Step 1: Opening Android Studio download page...
start https://developer.android.com/studio

echo.
echo Please download and install Android Studio from the browser that just opened.
echo.
echo After installation, run this script again to set up environment variables.
echo.
pause

echo.
echo Step 2: Setting up environment variables...
echo.

REM Check if ANDROID_HOME already exists
setx ANDROID_HOME "C:\Users\Farzeen\AppData\Local\Android\Sdk" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ ANDROID_HOME set successfully!
) else (
    echo ⚠️  Could not set ANDROID_HOME automatically.
    echo Please set it manually:
    echo    Variable name: ANDROID_HOME
    echo    Variable value: C:\Users\Farzeen\AppData\Local\Android\Sdk
)

echo.
echo Step 3: Adding to PATH...
echo.

REM Add platform-tools to PATH
setx PATH "%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\tools" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ PATH updated successfully!
) else (
    echo ⚠️  Could not update PATH automatically.
    echo Please add these manually to PATH:
    echo    %ANDROID_HOME%\platform-tools
    echo    %ANDROID_HOME%\tools
)

echo.
echo ========================================
echo IMPORTANT: Restart your computer now!
echo ========================================
echo.
echo After restart:
echo 1. Open Android Studio
echo 2. Go to Tools ^> Device Manager
echo 3. Create a new Virtual Device
echo 4. Run: npm start
echo 5. Press 'a' to open Android emulator
echo.
pause







echo ========================================
echo Android Studio Installation Helper
echo ========================================
echo.

echo Step 1: Opening Android Studio download page...
start https://developer.android.com/studio

echo.
echo Please download and install Android Studio from the browser that just opened.
echo.
echo After installation, run this script again to set up environment variables.
echo.
pause

echo.
echo Step 2: Setting up environment variables...
echo.

REM Check if ANDROID_HOME already exists
setx ANDROID_HOME "C:\Users\Farzeen\AppData\Local\Android\Sdk" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ ANDROID_HOME set successfully!
) else (
    echo ⚠️  Could not set ANDROID_HOME automatically.
    echo Please set it manually:
    echo    Variable name: ANDROID_HOME
    echo    Variable value: C:\Users\Farzeen\AppData\Local\Android\Sdk
)

echo.
echo Step 3: Adding to PATH...
echo.

REM Add platform-tools to PATH
setx PATH "%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\tools" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ PATH updated successfully!
) else (
    echo ⚠️  Could not update PATH automatically.
    echo Please add these manually to PATH:
    echo    %ANDROID_HOME%\platform-tools
    echo    %ANDROID_HOME%\tools
)

echo.
echo ========================================
echo IMPORTANT: Restart your computer now!
echo ========================================
echo.
echo After restart:
echo 1. Open Android Studio
echo 2. Go to Tools ^> Device Manager
echo 3. Create a new Virtual Device
echo 4. Run: npm start
echo 5. Press 'a' to open Android emulator
echo.
pause







echo ========================================
echo Android Studio Installation Helper
echo ========================================
echo.

echo Step 1: Opening Android Studio download page...
start https://developer.android.com/studio

echo.
echo Please download and install Android Studio from the browser that just opened.
echo.
echo After installation, run this script again to set up environment variables.
echo.
pause

echo.
echo Step 2: Setting up environment variables...
echo.

REM Check if ANDROID_HOME already exists
setx ANDROID_HOME "C:\Users\Farzeen\AppData\Local\Android\Sdk" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ ANDROID_HOME set successfully!
) else (
    echo ⚠️  Could not set ANDROID_HOME automatically.
    echo Please set it manually:
    echo    Variable name: ANDROID_HOME
    echo    Variable value: C:\Users\Farzeen\AppData\Local\Android\Sdk
)

echo.
echo Step 3: Adding to PATH...
echo.

REM Add platform-tools to PATH
setx PATH "%PATH%;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\tools" /M 2>nul
if %ERRORLEVEL% EQU 0 (
    echo ✅ PATH updated successfully!
) else (
    echo ⚠️  Could not update PATH automatically.
    echo Please add these manually to PATH:
    echo    %ANDROID_HOME%\platform-tools
    echo    %ANDROID_HOME%\tools
)

echo.
echo ========================================
echo IMPORTANT: Restart your computer now!
echo ========================================
echo.
echo After restart:
echo 1. Open Android Studio
echo 2. Go to Tools ^> Device Manager
echo 3. Create a new Virtual Device
echo 4. Run: npm start
echo 5. Press 'a' to open Android emulator
echo.
pause










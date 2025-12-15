@echo off
echo Cleaning and starting Expo...
echo.

REM Clean install
echo Step 1: Cleaning node_modules...
if exist node_modules rmdir /s /q node_modules
if exist package-lock.json del /q package-lock.json

echo Step 2: Installing dependencies...
call npm install

echo.
echo Step 3: Starting Expo with cleared cache...
echo.
call npx expo start -c

pause




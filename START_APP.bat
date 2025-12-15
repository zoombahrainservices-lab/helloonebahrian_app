@echo off
echo ========================================
echo  HelloOne Bahrain Mobile App Starter
echo ========================================
echo.
echo Killing any old Metro servers...
taskkill /F /IM node.exe >nul 2>&1
echo.
echo Starting Expo from mobile folder...
cd mobile
npx expo start --clear


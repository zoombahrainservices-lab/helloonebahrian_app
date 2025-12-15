# Emergency Fix Script for React Native Syntax Errors
# Run this if you continue to see syntax errors in node_modules

Write-Host "🚨 EMERGENCY FIX - Starting complete cleanup..." -ForegroundColor Red
Write-Host ""

# Step 1: Kill all Node processes
Write-Host "1️⃣ Stopping all Node/Expo processes..." -ForegroundColor Yellow
taskkill /F /IM node.exe 2>$null
taskkill /F /IM expo.exe 2>$null
Start-Sleep -Seconds 2
Write-Host "✓ Processes stopped" -ForegroundColor Green
Write-Host ""

# Step 2: Remove all caches and modules
Write-Host "2️⃣ Removing all caches and modules..." -ForegroundColor Yellow
if (Test-Path .\node_modules) {
    Remove-Item -Recurse -Force .\node_modules
    Write-Host "✓ node_modules removed" -ForegroundColor Green
}
if (Test-Path .\package-lock.json) {
    Remove-Item -Force .\package-lock.json
    Write-Host "✓ package-lock.json removed" -ForegroundColor Green
}
if (Test-Path .\.expo) {
    Remove-Item -Recurse -Force .\.expo
    Write-Host "✓ .expo cache removed" -ForegroundColor Green
}
Write-Host ""

# Step 3: Clear system temp caches
Write-Host "3️⃣ Clearing system temp caches..." -ForegroundColor Yellow
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\metro-*" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\haste-map-*" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\react-*" -ErrorAction SilentlyContinue
Write-Host "✓ System caches cleared" -ForegroundColor Green
Write-Host ""

# Step 4: Clear npm cache
Write-Host "4️⃣ Clearing npm cache..." -ForegroundColor Yellow
npm cache clean --force
Write-Host "✓ npm cache cleared" -ForegroundColor Green
Write-Host ""

# Step 5: Reinstall dependencies
Write-Host "5️⃣ Reinstalling dependencies (this may take a few minutes)..." -ForegroundColor Yellow
npm install --legacy-peer-deps
Write-Host "✓ Dependencies installed" -ForegroundColor Green
Write-Host ""

# Step 6: Instructions
Write-Host "✅ EMERGENCY FIX COMPLETE!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Run: npx expo start --clear" -ForegroundColor White
Write-Host "2. Wait for Metro bundler to start" -ForegroundColor White
Write-Host "3. Press 'a' for Android or 'i' for iOS" -ForegroundColor White
Write-Host ""
Write-Host "If you STILL see errors:" -ForegroundColor Yellow
Write-Host "- Your project may be in OneDrive (causing file lock issues)" -ForegroundColor White
Write-Host "- Consider moving to C:\Projects\" -ForegroundColor White
Write-Host "- Check if antivirus is blocking files" -ForegroundColor White
Write-Host ""







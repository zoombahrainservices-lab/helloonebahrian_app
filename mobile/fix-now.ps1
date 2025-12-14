# URGENT: Fix Corrupted node_modules
# This script will delete corrupted files and reinstall everything

Write-Host "🚨 FIXING CORRUPTED NODE_MODULES..." -ForegroundColor Red
Write-Host ""

# Step 1: Stop any running Expo processes
Write-Host "Step 1: Stopping Expo processes..." -ForegroundColor Yellow
Get-Process | Where-Object {$_.ProcessName -like "*expo*" -or $_.ProcessName -like "*node*"} | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# Step 2: Delete corrupted folders
Write-Host "Step 2: Deleting corrupted folders..." -ForegroundColor Yellow
Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .expo -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .metro -ErrorAction SilentlyContinue
Remove-Item -Force package-lock.json -ErrorAction SilentlyContinue
Write-Host "✅ Deleted node_modules, .expo, .metro, package-lock.json" -ForegroundColor Green

# Step 3: Clear npm cache
Write-Host "Step 3: Clearing npm cache..." -ForegroundColor Yellow
npm cache clean --force
Write-Host "✅ npm cache cleared" -ForegroundColor Green

# Step 4: Fresh install
Write-Host ""
Write-Host "Step 4: Installing fresh dependencies (this will take 3-5 minutes)..." -ForegroundColor Yellow
Write-Host "⏰ Please wait..." -ForegroundColor Cyan
npm install

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ SUCCESS! Dependencies installed." -ForegroundColor Green
    Write-Host ""
    Write-Host "Now run: npx expo start --clear" -ForegroundColor Cyan
    Write-Host "Then reload the app in emulator (press 'r' twice)" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "❌ Installation failed. Please check the errors above." -ForegroundColor Red
}


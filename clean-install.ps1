# Complete Clean Install Script for React Native/Expo
# This script clears all caches and reinstalls dependencies

Write-Host "🧹 Starting complete clean install..." -ForegroundColor Cyan

# Step 1: Clear Expo cache
Write-Host "`n📦 Clearing Expo cache..." -ForegroundColor Yellow
if (Test-Path .\.expo) {
    Remove-Item -Recurse -Force .\.expo
    Write-Host "✓ Expo cache cleared" -ForegroundColor Green
}

# Step 2: Clear node_modules
Write-Host "`n📦 Removing node_modules..." -ForegroundColor Yellow
if (Test-Path .\node_modules) {
    Remove-Item -Recurse -Force .\node_modules
    Write-Host "✓ node_modules removed" -ForegroundColor Green
}

# Step 3: Clear package-lock.json
Write-Host "`n📦 Removing package-lock.json..." -ForegroundColor Yellow
if (Test-Path .\package-lock.json) {
    Remove-Item -Force .\package-lock.json
    Write-Host "✓ package-lock.json removed" -ForegroundColor Green
}

# Step 4: Clear npm cache
Write-Host "`n📦 Clearing npm cache..." -ForegroundColor Yellow
npm cache clean --force
Write-Host "✓ npm cache cleared" -ForegroundColor Green

# Step 5: Reinstall dependencies
Write-Host "`n📦 Installing dependencies..." -ForegroundColor Yellow
npm install
Write-Host "✓ Dependencies installed" -ForegroundColor Green

# Step 6: Clear Metro bundler cache
Write-Host "`n📦 Clearing Metro bundler cache..." -ForegroundColor Yellow
Write-Host "✓ Ready to start with --clear flag" -ForegroundColor Green

Write-Host "`n✅ Clean install complete!" -ForegroundColor Green
Write-Host "`nTo start the app, run: npm start -- --clear" -ForegroundColor Cyan

# Complete Clean Install Script
# This fixes corrupted node_modules and all cache issues

Write-Host "🧹 Starting complete clean install..." -ForegroundColor Cyan

# Step 1: Stop any running processes
Write-Host "`n📋 Step 1: Stopping any running processes..." -ForegroundColor Yellow
Get-Process -Name "node" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue

# Step 2: Remove all caches and node_modules
Write-Host "`n📋 Step 2: Removing node_modules and caches..." -ForegroundColor Yellow
Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .expo -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force .metro -ErrorAction SilentlyContinue
Remove-Item -Force package-lock.json -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force $env:TEMP\metro-* -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force $env:TEMP\haste-* -ErrorAction SilentlyContinue

Write-Host "✅ Cleaned up old files" -ForegroundColor Green

# Step 3: Clear npm cache
Write-Host "`n📋 Step 3: Clearing npm cache..." -ForegroundColor Yellow
npm cache clean --force
Write-Host "✅ npm cache cleared" -ForegroundColor Green

# Step 4: Fresh install
Write-Host "`n📋 Step 4: Installing dependencies (this takes 3-5 minutes)..." -ForegroundColor Yellow
npm install

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
    
    # Step 5: Verify critical packages
    Write-Host "`n📋 Step 5: Verifying installation..." -ForegroundColor Yellow
    $packages = @('babel-preset-expo', 'resolve-from', 'expo', 'react-native')
    $allGood = $true
    
    foreach ($pkg in $packages) {
        if (Test-Path "node_modules\$pkg") {
            Write-Host "  ✅ $pkg installed" -ForegroundColor Green
        } else {
            Write-Host "  ❌ $pkg missing!" -ForegroundColor Red
            $allGood = $false
        }
    }
    
    if ($allGood) {
        Write-Host "`n🎉 All packages installed correctly!" -ForegroundColor Green
        Write-Host "`n📋 Next steps:" -ForegroundColor Cyan
        Write-Host "  1. Run: npx expo start --clear" -ForegroundColor White
        Write-Host "  2. Reload app in emulator (press 'r' twice)" -ForegroundColor White
    } else {
        Write-Host "`n⚠️  Some packages are missing. Try running 'npm install' again." -ForegroundColor Yellow
    }
} else {
    Write-Host "`n❌ Installation failed. Check the error messages above." -ForegroundColor Red
    exit 1
}


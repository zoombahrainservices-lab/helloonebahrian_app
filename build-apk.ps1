# PowerShell script to build APK without OneDrive interference
# This script copies the mobile directory to a temp location and builds from there

Write-Host "`n🚀 Building APK (OneDrive Safe Mode)`n" -ForegroundColor Green

# Get the current directory (should be mobile/)
$mobileDir = Get-Location
$parentDir = Split-Path -Parent $mobileDir
$tempDir = "$env:TEMP\hellobahrain-build-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

Write-Host "📦 Creating temporary build directory..." -ForegroundColor Yellow
Write-Host "   Location: $tempDir`n" -ForegroundColor Gray

# Create temp directory
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

# Copy mobile directory to temp
Write-Host "📋 Copying mobile directory..." -ForegroundColor Yellow
Copy-Item -Path $mobileDir -Destination $tempDir -Recurse -Force

# Navigate to temp directory
Set-Location $tempDir\mobile

Write-Host "✅ Ready to build!`n" -ForegroundColor Green
Write-Host "🔨 Starting EAS Build...`n" -ForegroundColor Cyan

# Run the build
eas build --platform android --profile production

# Get the exit code
$exitCode = $LASTEXITCODE

# Cleanup
Write-Host "`n🧹 Cleaning up temporary files..." -ForegroundColor Yellow
Set-Location $parentDir
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue

if ($exitCode -eq 0) {
    Write-Host "`n✅ Build completed successfully!`n" -ForegroundColor Green
} else {
    Write-Host "`n❌ Build failed. Check the logs above.`n" -ForegroundColor Red
}

exit $exitCode

# This script copies the mobile directory to a temp location and builds from there

Write-Host "`n🚀 Building APK (OneDrive Safe Mode)`n" -ForegroundColor Green

# Get the current directory (should be mobile/)
$mobileDir = Get-Location
$parentDir = Split-Path -Parent $mobileDir
$tempDir = "$env:TEMP\hellobahrain-build-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

Write-Host "📦 Creating temporary build directory..." -ForegroundColor Yellow
Write-Host "   Location: $tempDir`n" -ForegroundColor Gray

# Create temp directory
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

# Copy mobile directory to temp
Write-Host "📋 Copying mobile directory..." -ForegroundColor Yellow
Copy-Item -Path $mobileDir -Destination $tempDir -Recurse -Force

# Navigate to temp directory
Set-Location $tempDir\mobile

Write-Host "✅ Ready to build!`n" -ForegroundColor Green
Write-Host "🔨 Starting EAS Build...`n" -ForegroundColor Cyan

# Run the build
eas build --platform android --profile production

# Get the exit code
$exitCode = $LASTEXITCODE

# Cleanup
Write-Host "`n🧹 Cleaning up temporary files..." -ForegroundColor Yellow
Set-Location $parentDir
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue

if ($exitCode -eq 0) {
    Write-Host "`n✅ Build completed successfully!`n" -ForegroundColor Green
} else {
    Write-Host "`n❌ Build failed. Check the logs above.`n" -ForegroundColor Red
}

exit $exitCode

# This script copies the mobile directory to a temp location and builds from there

Write-Host "`n🚀 Building APK (OneDrive Safe Mode)`n" -ForegroundColor Green

# Get the current directory (should be mobile/)
$mobileDir = Get-Location
$parentDir = Split-Path -Parent $mobileDir
$tempDir = "$env:TEMP\hellobahrain-build-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

Write-Host "📦 Creating temporary build directory..." -ForegroundColor Yellow
Write-Host "   Location: $tempDir`n" -ForegroundColor Gray

# Create temp directory
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

# Copy mobile directory to temp
Write-Host "📋 Copying mobile directory..." -ForegroundColor Yellow
Copy-Item -Path $mobileDir -Destination $tempDir -Recurse -Force

# Navigate to temp directory
Set-Location $tempDir\mobile

Write-Host "✅ Ready to build!`n" -ForegroundColor Green
Write-Host "🔨 Starting EAS Build...`n" -ForegroundColor Cyan

# Run the build
eas build --platform android --profile production

# Get the exit code
$exitCode = $LASTEXITCODE

# Cleanup
Write-Host "`n🧹 Cleaning up temporary files..." -ForegroundColor Yellow
Set-Location $parentDir
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue

if ($exitCode -eq 0) {
    Write-Host "`n✅ Build completed successfully!`n" -ForegroundColor Green
} else {
    Write-Host "`n❌ Build failed. Check the logs above.`n" -ForegroundColor Red
}

exit $exitCode

# This script copies the mobile directory to a temp location and builds from there

Write-Host "`n🚀 Building APK (OneDrive Safe Mode)`n" -ForegroundColor Green

# Get the current directory (should be mobile/)
$mobileDir = Get-Location
$parentDir = Split-Path -Parent $mobileDir
$tempDir = "$env:TEMP\hellobahrain-build-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

Write-Host "📦 Creating temporary build directory..." -ForegroundColor Yellow
Write-Host "   Location: $tempDir`n" -ForegroundColor Gray

# Create temp directory
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

# Copy mobile directory to temp
Write-Host "📋 Copying mobile directory..." -ForegroundColor Yellow
Copy-Item -Path $mobileDir -Destination $tempDir -Recurse -Force

# Navigate to temp directory
Set-Location $tempDir\mobile

Write-Host "✅ Ready to build!`n" -ForegroundColor Green
Write-Host "🔨 Starting EAS Build...`n" -ForegroundColor Cyan

# Run the build
eas build --platform android --profile production

# Get the exit code
$exitCode = $LASTEXITCODE

# Cleanup
Write-Host "`n🧹 Cleaning up temporary files..." -ForegroundColor Yellow
Set-Location $parentDir
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue

if ($exitCode -eq 0) {
    Write-Host "`n✅ Build completed successfully!`n" -ForegroundColor Green
} else {
    Write-Host "`n❌ Build failed. Check the logs above.`n" -ForegroundColor Red
}

exit $exitCode




# PERMANENT FIX: Move project out of OneDrive to shorter path
# This solves the Windows 260 character path limit issue

Write-Host "🔧 PERMANENT FIX: Moving project to shorter path..." -ForegroundColor Green
Write-Host ""

$currentPath = "C:\Users\Farzeen\OneDrive\Desktop\Helloone.app"
$newPath = "C:\dev\Helloone.app"

# Check if project exists
if (-not (Test-Path $currentPath)) {
    Write-Host "❌ Project not found at: $currentPath" -ForegroundColor Red
    Write-Host "Please update the path in this script." -ForegroundColor Yellow
    exit 1
}

# Create C:\dev directory
Write-Host "📁 Creating C:\dev directory..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "C:\dev" -Force | Out-Null

# Check if destination exists
if (Test-Path $newPath) {
    Write-Host "⚠️  Destination already exists: $newPath" -ForegroundColor Yellow
    $response = Read-Host "Delete and move? (y/n)"
    if ($response -ne "y") {
        Write-Host "Cancelled." -ForegroundColor Red
        exit 0
    }
    Remove-Item -Recurse -Force $newPath
}

# Move project
Write-Host "🚀 Moving project from OneDrive to C:\dev..." -ForegroundColor Yellow
Write-Host "   From: $currentPath" -ForegroundColor Gray
Write-Host "   To:   $newPath" -ForegroundColor Gray
Write-Host ""
Write-Host "This may take a few minutes..." -ForegroundColor Yellow

try {
    Move-Item -Path $currentPath -Destination $newPath -Force
    Write-Host ""
    Write-Host "✅ SUCCESS! Project moved!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📝 Next steps:" -ForegroundColor Cyan
    Write-Host "1. Close Cursor/VS Code" -ForegroundColor White
    Write-Host "2. Open Cursor/VS Code" -ForegroundColor White
    Write-Host "3. File → Open Folder → Select: C:\dev\Helloone.app" -ForegroundColor White
    Write-Host "4. Run: cd mobile; npx expo run:android" -ForegroundColor White
    Write-Host ""
    Write-Host "🎉 Your project is now in a shorter path and will work forever!" -ForegroundColor Green
} catch {
    Write-Host ""
    Write-Host "❌ Error moving project: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Try manually:" -ForegroundColor Yellow
    Write-Host "1. Close all programs using the project" -ForegroundColor White
    Write-Host "2. Copy folder manually from OneDrive to C:\dev" -ForegroundColor White
    Write-Host "3. Open new location in Cursor/VS Code" -ForegroundColor White
}





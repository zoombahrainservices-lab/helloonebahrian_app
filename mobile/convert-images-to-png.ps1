# PowerShell script to convert JPG images to PNG
Add-Type -AssemblyName System.Drawing

Write-Host ""
Write-Host "Converting JPG images to PNG..." -ForegroundColor Green
Write-Host ""

$sourceFile = "assets\AppIcons\Assets.xcassets\AppIcon.appiconset\_\1024.png"
$targetDir = "assets"

if (Test-Path $sourceFile) {
    try {
        $fullPath = (Resolve-Path $sourceFile).Path
        $image = [System.Drawing.Image]::FromFile($fullPath)
        $pngFormat = [System.Drawing.Imaging.ImageFormat]::Png
        
        $iconPath = Join-Path (Resolve-Path $targetDir).Path "icon.png"
        $adaptivePath = Join-Path (Resolve-Path $targetDir).Path "adaptive-icon.png"
        $splashPath = Join-Path (Resolve-Path $targetDir).Path "splash.png"
        
        $image.Save($iconPath, $pngFormat)
        $image.Save($adaptivePath, $pngFormat)
        $image.Save($splashPath, $pngFormat)
        
        $image.Dispose()
        Write-Host "SUCCESS: Converted and saved PNG files!" -ForegroundColor Green
        Write-Host "  - icon.png" -ForegroundColor White
        Write-Host "  - adaptive-icon.png" -ForegroundColor White
        Write-Host "  - splash.png" -ForegroundColor White
        Write-Host ""
    } catch {
        Write-Host "ERROR: Conversion failed" -ForegroundColor Red
        Write-Host "Please use manual conversion - see CONVERT_IMAGES_TO_PNG.md" -ForegroundColor Yellow
        Write-Host ""
    }
} else {
    Write-Host "ERROR: Source file not found" -ForegroundColor Red
    Write-Host ""
}


Write-Host ""
Write-Host "Converting JPG images to PNG..." -ForegroundColor Green
Write-Host ""

$sourceFile = "assets\AppIcons\Assets.xcassets\AppIcon.appiconset\_\1024.png"
$targetDir = "assets"

if (Test-Path $sourceFile) {
    try {
        $fullPath = (Resolve-Path $sourceFile).Path
        $image = [System.Drawing.Image]::FromFile($fullPath)
        $pngFormat = [System.Drawing.Imaging.ImageFormat]::Png
        
        $iconPath = Join-Path (Resolve-Path $targetDir).Path "icon.png"
        $adaptivePath = Join-Path (Resolve-Path $targetDir).Path "adaptive-icon.png"
        $splashPath = Join-Path (Resolve-Path $targetDir).Path "splash.png"
        
        $image.Save($iconPath, $pngFormat)
        $image.Save($adaptivePath, $pngFormat)
        $image.Save($splashPath, $pngFormat)
        
        $image.Dispose()
        Write-Host "SUCCESS: Converted and saved PNG files!" -ForegroundColor Green
        Write-Host "  - icon.png" -ForegroundColor White
        Write-Host "  - adaptive-icon.png" -ForegroundColor White
        Write-Host "  - splash.png" -ForegroundColor White
        Write-Host ""
    } catch {
        Write-Host "ERROR: Conversion failed" -ForegroundColor Red
        Write-Host "Please use manual conversion - see CONVERT_IMAGES_TO_PNG.md" -ForegroundColor Yellow
        Write-Host ""
    }
} else {
    Write-Host "ERROR: Source file not found" -ForegroundColor Red
    Write-Host ""
}


Write-Host ""
Write-Host "Converting JPG images to PNG..." -ForegroundColor Green
Write-Host ""

$sourceFile = "assets\AppIcons\Assets.xcassets\AppIcon.appiconset\_\1024.png"
$targetDir = "assets"

if (Test-Path $sourceFile) {
    try {
        $fullPath = (Resolve-Path $sourceFile).Path
        $image = [System.Drawing.Image]::FromFile($fullPath)
        $pngFormat = [System.Drawing.Imaging.ImageFormat]::Png
        
        $iconPath = Join-Path (Resolve-Path $targetDir).Path "icon.png"
        $adaptivePath = Join-Path (Resolve-Path $targetDir).Path "adaptive-icon.png"
        $splashPath = Join-Path (Resolve-Path $targetDir).Path "splash.png"
        
        $image.Save($iconPath, $pngFormat)
        $image.Save($adaptivePath, $pngFormat)
        $image.Save($splashPath, $pngFormat)
        
        $image.Dispose()
        Write-Host "SUCCESS: Converted and saved PNG files!" -ForegroundColor Green
        Write-Host "  - icon.png" -ForegroundColor White
        Write-Host "  - adaptive-icon.png" -ForegroundColor White
        Write-Host "  - splash.png" -ForegroundColor White
        Write-Host ""
    } catch {
        Write-Host "ERROR: Conversion failed" -ForegroundColor Red
        Write-Host "Please use manual conversion - see CONVERT_IMAGES_TO_PNG.md" -ForegroundColor Yellow
        Write-Host ""
    }
} else {
    Write-Host "ERROR: Source file not found" -ForegroundColor Red
    Write-Host ""
}


Write-Host ""
Write-Host "Converting JPG images to PNG..." -ForegroundColor Green
Write-Host ""

$sourceFile = "assets\AppIcons\Assets.xcassets\AppIcon.appiconset\_\1024.png"
$targetDir = "assets"

if (Test-Path $sourceFile) {
    try {
        $fullPath = (Resolve-Path $sourceFile).Path
        $image = [System.Drawing.Image]::FromFile($fullPath)
        $pngFormat = [System.Drawing.Imaging.ImageFormat]::Png
        
        $iconPath = Join-Path (Resolve-Path $targetDir).Path "icon.png"
        $adaptivePath = Join-Path (Resolve-Path $targetDir).Path "adaptive-icon.png"
        $splashPath = Join-Path (Resolve-Path $targetDir).Path "splash.png"
        
        $image.Save($iconPath, $pngFormat)
        $image.Save($adaptivePath, $pngFormat)
        $image.Save($splashPath, $pngFormat)
        
        $image.Dispose()
        Write-Host "SUCCESS: Converted and saved PNG files!" -ForegroundColor Green
        Write-Host "  - icon.png" -ForegroundColor White
        Write-Host "  - adaptive-icon.png" -ForegroundColor White
        Write-Host "  - splash.png" -ForegroundColor White
        Write-Host ""
    } catch {
        Write-Host "ERROR: Conversion failed" -ForegroundColor Red
        Write-Host "Please use manual conversion - see CONVERT_IMAGES_TO_PNG.md" -ForegroundColor Yellow
        Write-Host ""
    }
} else {
    Write-Host "ERROR: Source file not found" -ForegroundColor Red
    Write-Host ""
}

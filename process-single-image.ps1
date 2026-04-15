# Process single image
# Function: Resize a single image

Add-Type -AssemblyName System.Drawing

Write-Host "Processing image..." -ForegroundColor Yellow

$inputImage = "product1.jpg"
$outputImage = "product1_resized.jpg"
$width = 400
$height = 300

try {
    if (Test-Path $inputImage) {
        Write-Host "Loading: $inputImage" -ForegroundColor Cyan
        $image = [System.Drawing.Image]::FromFile($inputImage)
        
        Write-Host "Creating new bitmap: ${width}x${height}" -ForegroundColor Cyan
        $newImage = New-Object System.Drawing.Bitmap($width, $height)
        $graphics = [System.Drawing.Graphics]::FromImage($newImage)
        
        # Set high quality rendering
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
        
        Write-Host "Drawing image" -ForegroundColor Cyan
        $graphics.DrawImage($image, 0, 0, $width, $height)
        
        Write-Host "Saving: $outputImage" -ForegroundColor Cyan
        $newImage.Save($outputImage, [System.Drawing.Imaging.ImageFormat]::Jpeg)
        
        # Release resources
        $graphics.Dispose()
        $newImage.Dispose()
        $image.Dispose()
        
        # Show file size comparison
        $originalSize = (Get-Item $inputImage).Length
        $compressedSize = (Get-Item $outputImage).Length
        $reduction = [math]::Round((1 - $compressedSize / $originalSize) * 100, 2)
        
        Write-Host "Success!" -ForegroundColor Green
        Write-Host "Original size: $([math]::Round($originalSize / 1KB, 2)) KB" -ForegroundColor Cyan
        Write-Host "Processed size: $([math]::Round($compressedSize / 1KB, 2)) KB" -ForegroundColor Cyan
        Write-Host "Reduction: $reduction%" -ForegroundColor Cyan
        
    } else {
        Write-Host "File not found: $inputImage" -ForegroundColor Red
    }
} catch {
    Write-Host "Failed: $_" -ForegroundColor Red
}

Write-Host "Done!" -ForegroundColor Yellow

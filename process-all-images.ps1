# Process all product images
# Function: Resize all product images to uniform size

Add-Type -AssemblyName System.Drawing

function Process-Single-Image {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Width = 400,
        [int]$Height = 300
    )

    try {
        if (Test-Path $InputPath) {
            Write-Host "Processing: $InputPath" -ForegroundColor Yellow
            
            # Load image
            $image = [System.Drawing.Image]::FromFile($InputPath)
            
            # Create new bitmap
            $newImage = New-Object System.Drawing.Bitmap($Width, $Height)
            $graphics = [System.Drawing.Graphics]::FromImage($newImage)
            
            # Set high quality rendering
            $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
            $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
            $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
            $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
            
            # Draw image
            $graphics.DrawImage($image, 0, 0, $Width, $Height)
            
            # Save image
            $newImage.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
            
            # Release resources
            $graphics.Dispose()
            $newImage.Dispose()
            $image.Dispose()
            
            # Show file size comparison
            $originalSize = (Get-Item $InputPath).Length
            $compressedSize = (Get-Item $OutputPath).Length
            $reduction = [math]::Round((1 - $compressedSize / $originalSize) * 100, 2)
            
            Write-Host "Success: $OutputPath" -ForegroundColor Green
            Write-Host "Original: $([math]::Round($originalSize / 1KB, 2)) KB" -ForegroundColor Cyan
            Write-Host "Processed: $([math]::Round($compressedSize / 1KB, 2)) KB" -ForegroundColor Cyan
            Write-Host "Reduction: $reduction%" -ForegroundColor Cyan
            
            # Add a small delay to avoid resource conflicts
            Start-Sleep -Milliseconds 500
            
        } else {
            Write-Host "File not found: $InputPath" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Failed: $_" -ForegroundColor Red
    }
}

Write-Host "Processing all product images..." -ForegroundColor Yellow
Write-Host "======================" -ForegroundColor Yellow

# Process each image individually
Process-Single-Image -InputPath "product1.jpg" -OutputPath "product1.jpg"
Process-Single-Image -InputPath "product2.jpg" -OutputPath "product2.jpg"
Process-Single-Image -InputPath "product3.jpg" -OutputPath "product3.jpg"
Process-Single-Image -InputPath "product4.jpg" -OutputPath "product4.jpg"
Process-Single-Image -InputPath "product5.jpg" -OutputPath "product5.jpg"
Process-Single-Image -InputPath "product6.jpg" -OutputPath "product6.jpg"
Process-Single-Image -InputPath "product7.jpg" -OutputPath "product7.jpg"
Process-Single-Image -InputPath "product8.jpeg" -OutputPath "product8.jpg"
Process-Single-Image -InputPath "product9.jpg" -OutputPath "product9.jpg"
Process-Single-Image -InputPath "product10.jpg" -OutputPath "product10.jpg"

Write-Host "" -ForegroundColor Yellow
Write-Host "======================" -ForegroundColor Yellow
Write-Host "All images processed!" -ForegroundColor Green
Write-Host "Images resized to 400x300 pixels" -ForegroundColor Cyan

# Process all product images
# Function: Resize all product images to uniform size

Add-Type -AssemblyName System.Drawing

function Process-Image {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Width = 400,
        [int]$Height = 300
    )

    try {
        if (Test-Path $InputPath) {
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
            Write-Host "Original size: $([math]::Round($originalSize / 1KB, 2)) KB" -ForegroundColor Cyan
            Write-Host "Processed size: $([math]::Round($compressedSize / 1KB, 2)) KB" -ForegroundColor Cyan
            Write-Host "Reduction: $reduction%" -ForegroundColor Cyan
            
        } else {
            Write-Host "File not found: $InputPath" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Failed: $_" -ForegroundColor Red
    }
}

Write-Host "Processing all product images..." -ForegroundColor Yellow
Write-Host "======================" -ForegroundColor Yellow

# Product list
$products = @(
    @{ Input = "product1.jpg"; Output = "product1_resized.jpg" },
    @{ Input = "product2.jpg"; Output = "product2_resized.jpg" },
    @{ Input = "product3.jpg"; Output = "product3_resized.jpg" },
    @{ Input = "product4.jpg"; Output = "product4_resized.jpg" },
    @{ Input = "product5.jpg"; Output = "product5_resized.jpg" },
    @{ Input = "product6.jpg"; Output = "product6_resized.jpg" },
    @{ Input = "product7.jpg"; Output = "product7_resized.jpg" },
    @{ Input = "product8.jpeg"; Output = "product8_resized.jpg" },
    @{ Input = "product9.jpg"; Output = "product9_resized.jpg" },
    @{ Input = "product10.jpg"; Output = "product10_resized.jpg" }
)

# Process each product
foreach ($product in $products) {
    Write-Host "" -ForegroundColor Yellow
    Write-Host "Processing: $($product.Input)" -ForegroundColor Yellow
    Process-Image -InputPath $product.Input -OutputPath $product.Output -Width 400 -Height 300
}

Write-Host "" -ForegroundColor Yellow
Write-Host "======================" -ForegroundColor Yellow
Write-Host "All images processed!" -ForegroundColor Green
Write-Host "Images resized to 400x300 pixels" -ForegroundColor Cyan

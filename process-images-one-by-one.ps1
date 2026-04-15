# Process images one by one
# Function: Resize images individually

Add-Type -AssemblyName System.Drawing

Write-Host "Processing images one by one..." -ForegroundColor Yellow

# Process product1
Write-Host "\nProcessing product1.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product1.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product1_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product1_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product2
Write-Host "\nProcessing product2.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product2.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product2_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product2_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product3
Write-Host "\nProcessing product3.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product3.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product3_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product3_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product4
Write-Host "\nProcessing product4.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product4.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product4_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product4_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product5
Write-Host "\nProcessing product5.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product5.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product5_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product5_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product6
Write-Host "\nProcessing product6.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product6.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product6_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product6_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product7
Write-Host "\nProcessing product7.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product7.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product7_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product7_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product8
Write-Host "\nProcessing product8.jpeg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product8.jpeg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product8_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product8_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product9
Write-Host "\nProcessing product9.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product9.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product9_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product9_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

# Process product10
Write-Host "\nProcessing product10.jpg..." -ForegroundColor Yellow
try {
    $image = [System.Drawing.Image]::FromFile("product10.jpg")
    $newImage = New-Object System.Drawing.Bitmap(400, 300)
    $graphics = [System.Drawing.Graphics]::FromImage($newImage)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.DrawImage($image, 0, 0, 400, 300)
    $newImage.Save("product10_resized.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $graphics.Dispose()
    $newImage.Dispose()
    $image.Dispose()
    Write-Host "Success: product10_resized.jpg" -ForegroundColor Green
} catch {
    Write-Host "Failed: $_.Exception.Message" -ForegroundColor Red
}

Write-Host "\nAll images processed!" -ForegroundColor Green

# Image compression script
Add-Type -AssemblyName System.Drawing

# Backup original image
Copy-Item "about.jpg" -Destination "about_original.jpg" -Force
Write-Host "Backup created: about_original.jpg"

# Load image
$img = [System.Drawing.Image]::FromFile((Resolve-Path "about_original.jpg"))

# Get JPEG encoder
$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | 
           Where-Object { $_.MimeType -eq "image/jpeg" }

# Set quality parameter (80%)
$ep = New-Object System.Drawing.Imaging.EncoderParameters(1)
$ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter(
    [System.Drawing.Imaging.Encoder]::Quality, 80L
)

# Save compressed image
$img.Save((Resolve-Path ".").Path + "\about.jpg", $encoder, $ep)
$img.Dispose()

# Show results
$originalSize = (Get-Item "about_original.jpg").Length
$newSize = (Get-Item "about.jpg").Length
$reduction = [math]::Round((1 - $newSize / $originalSize) * 100, 2)

Write-Host "Original: $([math]::Round($originalSize / 1MB, 2)) MB"
Write-Host "Compressed: $([math]::Round($newSize / 1KB, 2)) KB"
Write-Host "Reduction: $reduction%"
Write-Host "Done!"

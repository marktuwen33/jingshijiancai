# 简单图片压缩脚本
Add-Type -AssemblyName System.Drawing

# 备份原始图片
Copy-Item "about.jpg" -Destination "about_original.jpg" -Force
Write-Host "已备份原始图片到 about_original.jpg"

# 加载图片
$img = [System.Drawing.Image]::FromFile((Resolve-Path "about_original.jpg"))

# 获取JPEG编码器
$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | 
           Where-Object { $_.MimeType -eq "image/jpeg" }

# 设置质量参数（80%）
$ep = New-Object System.Drawing.Imaging.EncoderParameters(1)
$ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter(
    [System.Drawing.Imaging.Encoder]::Quality, 80L
)

# 保存压缩后的图片
$img.Save((Resolve-Path ".").Path + "\about.jpg", $encoder, $ep)
$img.Dispose()

# 显示结果
$originalSize = (Get-Item "about_original.jpg").Length
$newSize = (Get-Item "about.jpg").Length
$reduction = [math]::Round((1 - $newSize / $originalSize) * 100, 2)

Write-Host "原始大小: $([math]::Round($originalSize / 1MB, 2)) MB"
Write-Host "压缩后: $([math]::Round($newSize / 1KB, 2)) KB"
Write-Host "节省了: $reduction%"
Write-Host "压缩完成！"

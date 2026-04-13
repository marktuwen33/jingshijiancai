# 图片压缩脚本
# 使用方法：.\compress-images.ps1

Add-Type -AssemblyName System.Drawing

function Compress-Image {
    param(
        [string]$InputPath,
        [string]$OutputPath,
        [int]$Quality = 80
    )

    try {
        $image = [System.Drawing.Image]::FromFile($InputPath)
        
        # 获取JPEG编码器
        $encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | 
                   Where-Object { $_.MimeType -eq "image/jpeg" }
        
        if ($encoder -eq $null) {
            Write-Host "找不到JPEG编码器" -ForegroundColor Red
            return
        }
        
        # 设置编码器参数
        $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
        $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter(
            [System.Drawing.Imaging.Encoder]::Quality,
            $Quality
        )
        
        # 保存压缩后的图片
        $image.Save($OutputPath, $encoder, $encoderParams)
        $image.Dispose()
        
        Write-Host "压缩成功: $OutputPath" -ForegroundColor Green
        
        # 显示文件大小对比
        $originalSize = (Get-Item $InputPath).Length
        $compressedSize = (Get-Item $OutputPath).Length
        $reduction = [math]::Round((1 - $compressedSize / $originalSize) * 100, 2)
        
        Write-Host "原始大小: $([math]::Round($originalSize / 1KB, 2)) KB" -ForegroundColor Cyan
        Write-Host "压缩后大小: $([math]::Round($compressedSize / 1KB, 2)) KB" -ForegroundColor Cyan
        Write-Host "压缩率: $reduction%" -ForegroundColor Cyan
        
    } catch {
        Write-Host "压缩失败: $_" -ForegroundColor Red
    }
}

# 压缩about.jpg
Write-Host "开始压缩图片..." -ForegroundColor Yellow
Write-Host "======================" -ForegroundColor Yellow

$imagePath = "about.jpg"
$backupPath = "about_original.jpg"
$compressedPath = "about.jpg"

if (Test-Path $imagePath) {
    # 备份原始图片
    if (-not (Test-Path $backupPath)) {
        Copy-Item $imagePath -Destination $backupPath
        Write-Host "已备份原始图片到: $backupPath" -ForegroundColor Yellow
    }
    
    # 压缩图片，质量设置为80%
    Compress-Image -InputPath $backupPath -OutputPath $compressedPath -Quality 80
    
    Write-Host "======================" -ForegroundColor Yellow
    Write-Host "压缩完成！" -ForegroundColor Green
    Write-Host "原始图片已备份为: $backupPath" -ForegroundColor Yellow
    Write-Host "如果不满意，可以从备份恢复。" -ForegroundColor Yellow
} else {
    Write-Host "找不到图片文件: $imagePath" -ForegroundColor Red
}

Write-Host "`n按任意键退出..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

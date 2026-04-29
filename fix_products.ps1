# 修复产品11和产品12的重复描述
$htmlContent = Get-Content "晶石建材企业展示网站.html" -Raw

# 修复产品11 - 混合料
$oldProduct11 = @"
                <!-- 产品11 -->
                <div id="product-11" class="bg-light rounded-lg overflow-hidden shadow-lg hover-scale card-shadow">
                    <img src="product11_resized.jpg" alt="混合料" class="w-full h-52 object-contain p-4 bg-white">
                    <div class="p-5">
                        <h3 class="text-lg font-bold text-dark mb-2">混合料</h3>
                        <p class="text-gray-600 mb-3 text-sm">
                            尾矿渣石精选，质地密实，强度高<br>
                            适用场景：建筑地基填充、道路垫层、再生骨料生产<br>
                            粒径：20-300mm<br>
                            含泥量：≤20%
                        </p>
                    </div>
                </div>
"@

$newProduct11 = @"
                <!-- 产品11 -->
                <div id="product-11" class="bg-light rounded-lg overflow-hidden shadow-lg hover-scale card-shadow">
                    <img src="product11_resized.jpg" alt="混合料" class="w-full h-52 object-contain p-4 bg-white">
                    <div class="p-5">
                        <h3 class="text-lg font-bold text-dark mb-2">混合料</h3>
                        <p class="text-gray-600 mb-3 text-sm">
                            多种规格砂石科学配比，级配合理，稳定性好<br>
                            适用场景：道路基层、水稳层、场地硬化、基础回填<br>
                            粒径：5-31.5mm混合级配<br>
                            含泥量：≤3%
                        </p>
                    </div>
                </div>
"@

# 修复产品12 - 渣石
$oldProduct12 = @"
                <!-- 产品12 -->
                <div id="product-12" class="bg-light rounded-lg overflow-hidden shadow-lg hover-scale card-shadow">
                    <img src="product12_resized.jpg" alt="渣石" class="w-full h-52 object-contain p-4 bg-white">
                    <div class="p-5">
                        <h3 class="text-lg font-bold text-dark mb-2">渣石</h3>
                        <p class="text-gray-600 mb-3 text-sm">
                            尾矿渣石精选，质地密实，强度高<br>
                            适用场景：建筑地基填充、道路垫层、再生骨料生产<br>
                            粒径：20-300mm<br>
                            含泥量：≤20%
                        </p>
                    </div>
                </div>
"@

$newProduct12 = @"
                <!-- 产品12 -->
                <div id="product-12" class="bg-light rounded-lg overflow-hidden shadow-lg hover-scale card-shadow">
                    <img src="product12_resized.jpg" alt="填海石" class="w-full h-52 object-contain p-4 bg-white">
                    <div class="p-5">
                        <h3 class="text-lg font-bold text-dark mb-2">填海石</h3>
                        <p class="text-gray-600 mb-3 text-sm">
                            大块石料精选，抗压强度高，耐海水腐蚀<br>
                            适用场景：填海造陆、海堤建设、港口工程、护岸抛填<br>
                            粒径：500-1500mm<br>
                            含泥量：≤5%
                        </p>
                    </div>
                </div>
"@

# 替换内容
$htmlContent = $htmlContent.Replace($oldProduct11, $newProduct11)
$htmlContent = $htmlContent.Replace($oldProduct12, $newProduct12)

# 保存文件
$htmlContent | Set-Content "晶石建材企业展示网站.html" -NoNewline

Write-Host "产品描述修复完成！"

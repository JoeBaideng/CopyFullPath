# 获取当前脚本所在目录
$installDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$installDir = $installDir.TrimEnd('\')

# 文件路径
$regFile = "AddToContextMenu.reg"
$vbsFile = "RunCopyFullPath.vbs"

$regFilePath = Join-Path -Path $installDir -ChildPath $regFile
$vbsFilePath = Join-Path -Path $installDir -ChildPath $vbsFile

# 替换 REG 文件中的 {$INSTALL_DIR} 占位符
(Get-Content $regFilePath) -replace '\{\$INSTALL_DIR\}', [regex]::Escape($installDir) | Set-Content $regFilePath

# 替换 VBS 文件中的 {$INSTALL_DIR} 占位符
(Get-Content $vbsFilePath) -replace '\{\$INSTALL_DIR\}', [regex]::Escape($installDir) | Set-Content $vbsFilePath

# 写入注册表
Write-Output "Installing registry settings..."
Start-Process regedit.exe -ArgumentList "/s `"$regFilePath`"" -Wait

# 完成
Write-Output "InstallOK!"

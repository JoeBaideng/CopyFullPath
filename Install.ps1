# ��ȡ��ǰ�ű�����Ŀ¼
$installDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$installDir = $installDir.TrimEnd('\')

# �ļ�·��
$regFile = "AddToContextMenu.reg"
$vbsFile = "RunCopyFullPath.vbs"

$regFilePath = Join-Path -Path $installDir -ChildPath $regFile
$vbsFilePath = Join-Path -Path $installDir -ChildPath $vbsFile

# �滻 REG �ļ��е� {$INSTALL_DIR} ռλ��
(Get-Content $regFilePath) -replace '\{\$INSTALL_DIR\}', [regex]::Escape($installDir) | Set-Content $regFilePath

# �滻 VBS �ļ��е� {$INSTALL_DIR} ռλ��
(Get-Content $vbsFilePath) -replace '\{\$INSTALL_DIR\}', [regex]::Escape($installDir) | Set-Content $vbsFilePath

# д��ע���
Write-Output "Installing registry settings..."
Start-Process regedit.exe -ArgumentList "/s `"$regFilePath`"" -Wait

# ���
Write-Output "InstallOK!"

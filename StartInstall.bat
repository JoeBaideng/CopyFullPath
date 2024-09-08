@echo off
:: 启动 PowerShell 并执行指定的 .ps1 脚本
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "./Install.ps1"

:: 等待脚本完成（可选）
echo Script execution completed.
pause

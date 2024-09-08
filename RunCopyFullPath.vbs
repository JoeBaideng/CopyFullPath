Set objShell = CreateObject("WScript.Shell")
Set args = WScript.Arguments
path = args(0)

' 构造 PowerShell 命令，注意路径的正确性
powershellCmd = "powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File ""C:\\MyTools\\CopyFullPathTool\CopyFullPath.ps1"" """ & path & """"

' 隐藏运行 PowerShell 脚本
objShell.Run powershellCmd, 0, True

Set objShell = CreateObject("WScript.Shell")
Set args = WScript.Arguments
path = args(0)

' ���� PowerShell ���ע��·������ȷ��
powershellCmd = "powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File ""C:\\MyTools\\CopyFullPathTool\CopyFullPath.ps1"" """ & path & """"

' �������� PowerShell �ű�
objShell.Run powershellCmd, 0, True

# 获取传递的路径参数
$path = $args[0]
# 将路径中的反斜杠转换为正斜杠
$path = $path -replace '\\', '/'
# 将路径复制到剪贴板
Set-Clipboard -Value $path

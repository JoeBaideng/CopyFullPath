# ��ȡ���ݵ�·������
$path = $args[0]
# ��·���еķ�б��ת��Ϊ��б��
$path = $path -replace '\\', '/'
# ��·�����Ƶ�������
Set-Clipboard -Value $path

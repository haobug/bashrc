#alias pip='sudo -H pip'

mkdir -p ~/.pip/

cat>~/.pip/pip.conf<<EOF
[global]
trusted-host = mirrors.aliyun.com
[install]
index-url = https://mirrors.aliyun.com/pypi/simple
EOF

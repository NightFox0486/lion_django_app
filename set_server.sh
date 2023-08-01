#!/bin/bash

# 현재 서버의 ip주소를 입력 받아, nginx설정에 넣기
# getopts
SERVER_IP=

MANUAL="Usage: $0 [-i server_ip]"

while getopts "i:" option; do
    case $option in
        i)
            SERVER_IP=$OPTARG
            ;;
        *)
            echo $MANUAL
            exit 1
            ;;
    esac
done

if [ -z $SERVER_IP ]; then
    echo $MANUAL
    exit 1
fi

# nginx 설치
echo "install nginx"
sudo apt install -y nginx
# nginx 설정 파일 생성
echo "create nginx config"
sudo sh -c 'cat > /etc/nginx/sites-available/django <<EOF
server {
	listen 80;
	server_name $SERVER_IP;

	location / {
		proxy_pass http://127.0.0.1:8000;
		proxy_set_header host $host;
		proxy_set_header X-Real-IP $remote_addr;
	}
}
EOF'
# symlink 생성
echo "create symlink"
sudo ln -s /etc/nginx/sites-available/django /etc/nginx/sites-enabled/
# nginx 재시작
echo "restart nginx"
sudo systemctl restart nginx
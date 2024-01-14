#/bin/env bash

NODE_VERSION='20.11.0'

function echoGreen() {
	echo -e "\033[32m $@ \033[0m"
}

echoGreen "安装程序初始化中"
apt update;
apt install wget unzip curl -y;


echoGreen "------------正在安装nodejs------------"
wget https://nodejs.org/download/release/latest-v20.x/node-v${NODE_VERSION}-linux-x64.tar.gz -O node.tar.gz
tar -zxvf node.tar.gz
mv node-v${NODE_VERSION}-linux-x64 /usr/local/
echo PATH=/usr/local/node-v${NODE_VERSION}-linux-x64/bin:'$PATH' >> .profile
source .profile
npm install pm2 http-server -g


echoGreen '----------------正在安装openresty--------------'
apt-get -y install --no-install-recommends wget gnupg ca-certificates
wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
| sudo tee /etc/apt/sources.list.d/openresty.list
apt update
apt -y install openresty
ln -s /usr/local/openresty/nginx/conf/ /etc/nginx

echoGreen '----------------正在安装mysql--------------'
apt install mysql-server -y


echoGreen '----------------正在安装redis--------------'
apt install redis-server -y;

#/bin/env bash


function echoGreen() {
	echo -e "\033[32m $@ \033[0m"
}

echoGreen "安装程序初始化中"
apt update;
apt install wget unzip curl -y;


echoGreen "------------正在安装nodejs------------"
curl -fsSL https://fnm.vercel.app/install | bash
source .bashrc 
fnm install --lts 

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

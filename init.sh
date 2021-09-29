#/bin/env bash


node=1
openresty=1
php=1

#安装node

apt install wget -y;


if [ $node -eq 1 ];then
	wget https://nodejs.org/dist/v14.18.0/node-v14.18.0-linux-x64.tar.xz -O node.tar.xz
	xz -d node.tar.xz
	tar -xvf node.tar 
	mv node-v14.18.0-linux-x64 /usr/local/
fi

if [ $openresty -eq 1 ];then
	apt-get -y install --no-install-recommends wget gnupg ca-certificates
	wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
	echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
    | sudo tee /etc/apt/sources.list.d/openresty.list
    apt-get update
    apt-get -y install openresty
fi


if [ $php -eq 1 ];then 
	add-apt-repository ppa:ondrej/php
	apt install -y php8.0 php8.0-cli php8.0-fpm php8.0-pdo php8.0-mysql php8.0-bcmath php8.0-xml \
	php8.0-redis php8.0-mongodb php8.0-mbstring php8.0-gd php8.0-curl php8.0-zip php8.0-dev php8.0
fi
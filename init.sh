#/bin/env bash


node=1
openresty=1
php=1
mysql=1
redis=1

#安装node

apt install wget -y;
apt insatll libevent -y;


if [ $node -eq 1 ];then
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm use 16
fi

if [ $openresty -eq 1 ];then
	apt-get -y install --no-install-recommends wget gnupg ca-certificates
	wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
	echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
    | sudo tee /etc/apt/sources.list.d/openresty.list
    apt update
    apt -y install openresty

    ln -s /usr/local/openresty/nginx/conf/ /etc/nginx
fi


if [ $php -eq 1 ];then 
	add-apt-repository -y ppa:ondrej/php
	apt install -y php8.0 php8.0-cli php8.0-fpm php8.0-pdo php8.0-mysql php8.0-bcmath php8.0-xml \
	php8.0-redis php8.0-mongodb php8.0-mbstring php8.0-gd php8.0-curl php8.0-zip php8.0-dev 
fi

if [ $mysql -eq 1 ];then
	apt install mysql-server -y
fi	

if [ $redis -eq 1 ];then
	apt install redis-server -y;
fi	

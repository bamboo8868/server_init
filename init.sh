#/bin/env bash


node=1
openresty=1
php=1
mysql=1
redis=1

#安装node

apt update;
apt install software-properties-common -y;
apt install wget -y;
apt install libevent -y;
apt install build-essential -y
apt install cmake -y;


if [ $node -eq 1 ];then
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
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
	apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-pdo php8.2-mysql php8.2-bcmath php8.2-xml \
	php8.2-redis php8.2-mongodb php8.2-mbstring php8.2-gd php8.2-curl php8.2-zip php8.2-dev 
fi


php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer



if [ $mysql -eq 1 ];then
	apt install mysql-server -y
fi	

if [ $redis -eq 1 ];then
	apt install redis-server -y;
fi	

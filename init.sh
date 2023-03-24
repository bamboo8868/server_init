#/bin/env bash


function echoGreen() {
	echo -e "\033[32m $@ \033[0m"
}

#安装node


echoGreen "安装程序初始化中"
apt update;
apt install software-properties-common -y;
apt install wget -y;
apt install libevent-dev -y;
apt install build-essential -y
apt install cmake -y;
apt install docker.io -y 


echoGreen "------------正在安装nodejs------------"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts

echoGreen '----------------正在安装openresty--------------'
apt-get -y install --no-install-recommends wget gnupg ca-certificates
wget -O - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
echo "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
| sudo tee /etc/apt/sources.list.d/openresty.list
apt update
apt -y install openresty
ln -s /usr/local/openresty/nginx/conf/ /etc/nginx

echoGreen '----------------正在安装php--------------'
add-apt-repository -y ppa:ondrej/php
apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-pdo php8.2-mysql php8.2-bcmath php8.2-xml \
php8.2-redis php8.2-mongodb php8.2-mbstring php8.2-gd php8.2-curl php8.2-zip php8.2-dev 



php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer




echoGreen '----------------正在安装mysql--------------'
apt install mysql-server -y


echoGreen '----------------正在安装redis--------------'
apt install redis-server -y;

echoGreen '----------------正在安装rabbitmq------------'
docker pull rabbitmq:3.9.22-management-alpine
docker run -it -d -p 5672:5672 -p 15672:15672 rabbitmq:3.9.22-management-alpine --restart=always

#!/bin/sh
#    If you update this from Windows, using Notepad ++, do the following:
#       sudo apt-get -y install dos2unix
#       dos2unix <FILE>
#       chmod u+x <FILE>
#
clear
echo "
 _____             _         _    _          _                                   
|     |___ ___ ___| |_ ___ _| |  | |_ _ _   |_|                                  
|   --|  _| -_| .'|  _| -_| . |  | . | | |   _                                   
|_____|_| |___|__,|_| |___|___|  |___|_  |  |_|                                  
                                     |___|                                       
                                                                                 
 _____ _       _     _           _              _____    __    _____             
|     | |_ ___|_|___| |_ ___ ___| |_ ___ ___   |     |__|  |  |   __|___ ___ _ _ 
|   --|   |  _| |_ -|  _| . | . |   | -_|  _|  | | | |  |  |  |  |  |  _| .'| | |
|_____|_|_|_| |_|___|_| |___|  _|_|_|___|_|    |_|_|_|_____|  |_____|_| |__,|_  |
                            |_|                                             |___|

https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_LEMP.sh

INSTALLS  LEMP (Linux* Nginx Memcache PHP & Postfix)

\r\n \r\n
Version:  1.4.1                             \r\n
Last Updated:  10/23/2019
\r\n \r\n
Updating system first..."
sudo -E apt-get update
wait
sudo -E apt-get upgrade -y
wait
echo "Downloading required dependencies...\r\n\r\n"
#--------------------------------------------------------------------------------------------
sudo apt-get -y dist-upgrade
wait
sudo apt-get install -y ntp ntpdate ssh openssh-server screen whois traceroute htop sysstat iptraf iftop speedometer ncdu nload
#---- Email -----
wait
sudo apt-get install -y postfix procmail postfix-pcre sasl2-bin postfix-cdb postfix-doc
# dovecot-core postfix-mysql
wait
wget -O "main.cf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/main.cf"
mv main.cf /etc/postfix/main.cf
/etc/init.d/postfix restart
#---------- PYTHON STUFF ----------------------------------
#sudo apt-get install -y python2-virtualenv python3-virtualenv libicu-dev python-software-properties python python-pip python-dev python3-setuptools
#wait
#--- PHP 7.2 ---
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
wait
sudo apt-get -y update
wait
sudo apt-get install -y openssl-blacklist ssl-cert libmcrypt-dev mcrypt 
sudo apt-get install -y php7.2 php7.2-cli php7.2-fpm php7.2-curl php7.2-json php7.2-gd php7.2-mysql php7.2-mbstring zip unzip
sudo apt-get install -y php7.2-common php7.2-opcache php7.2-readline php7.2-soap php7.2-ldap php-pear php-xdebug php-apcu php-ssh2 php-geoip php7.2-bcmath php7.2-zip php7.2-xml php-mailparse php7.2-bz2 php7.2-xmlrpc php7.2-mcrypt

wait
sudo pear channel-update pear.php.net
sudo pear install mail Net_SMTP Auth_SASL2-0.1.0 mail_mime
sudo pecl channel-update pecl.php.net

#--- PHP Memcached ----
sudo apt-get install -y php-memcached memcached
wait

cd ~
if [ -s "memcached.conf" ]
then
	echo "Deleting file  memcached.conf "
	rm memcached.conf
fi
echo "Downloading Memcache Config"
wget -O "memcached.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/memcached.conf"
wait
sudo cp "memcached.conf" "/etc/memcached.conf"
wait
echo "Memcache Config Download Complete"
wait
echo "Restarting service..."
/etc/init.d/memcached restart

#------- NGINX --------
sudo add-apt-repository -y ppa:chris-lea/nginx-devel
sudo apt-get -y update && apt-get -y install nginx nginx-common nginx-full fcgiwrap unzip gcc make libpcre3-dev zlib1g-dev
#sudo apt-get -y install nginx-pagespeed 

#-- Download PHP Configs ---
#sudo chmod +x /etc/init.d/php-fastcgi && /etc/init.d/php-fastcgi start  && update-rc.d php-fastcgi defaults
cd ~
echo "Downloading PHP-Fastcgi Config"
wget -O "php-fastcgi" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/php-fastcgi.sh"
wait
sudo mv "php-fastcgi" "/etc/init.d/php-fastcgi"
wait
sudo chmod +x /etc/init.d/php-fastcgi && /etc/init.d/php-fastcgi start && update-rc.d php-fastcgi defaults

mkdir "/media/data/"

if [ -s "/etc/php/7.2/fpm/php.ini" ]
then
	echo "Deleting file: PHP.ini config "
	rm /etc/php/7.2/fpm/php.ini
	rm /etc/php/7.2/fpm/php-fpm.conf
	rm /media/data/php_browscap.ini
fi
wait

echo "Downloading PHP-FPM Configs"
wget -O  "php.ini" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/php.ini"
sudo mv "php.ini" "/etc/php/7.2/fpm/php.ini"
wait
#--------------------------------------------------
wget -O "php-fpm.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/php-fpm.conf"
sudo mv "php-fpm.conf" "/etc/php/7.2/fpm/php-fpm.conf"
wait
#--------------------------------------------------
wget -O "php_browscap.ini" "https://browscap.org/stream?q=PHP_BrowsCapINI"
sudo mv "php_browscap.ini" "/media/data/php_browscap.ini"
wait
#--------------------------------------------------
echo "PHP-FPM Configs download complete"
#---------------------------------------------------------------------------------------------------------
if [ -s "/etc/nginx/nginx.conf" ]
then
	echo "Deleting file  nginx config "
	rm /etc/nginx/nginx.conf
	rm nginx.conf
fi
echo "Downloading Nginx Config"
wget -O "nginx_global_filetypes.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_filetypes.conf"
wget -O "nginx_global_logging.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_logging.conf"
wget -O "nginx_global_security.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_security.conf"
wget -O "nginx_global_tls.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx_global_tls.conf"
wget -O "nginx.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx.conf"

sudo mv "nginx_global_filetypes.conf" "/etc/nginx/snippets/nginx_global_filetypes.conf"
sudo mv "nginx_global_logging.conf" "/etc/nginx/snippets/nginx_global_logging.conf"
sudo mv "nginx_global_security.conf" "/etc/nginx/snippets/nginx_global_security.conf"
sudo mv "nginx_global_tls.conf" "/etc/nginx/snippets/nginx_global_tls.conf"
sudo mv "nginx.conf" "/etc/nginx/nginx.conf"

wait
echo "Nginx Config Download Complete"


echo "Downloading Basic HTTP/HTTPS Website Config"
#wget -O "site1.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/site1.conf"
wget -O "site1_80443.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/site1_80443.conf"
wait
sudo mv "site1_80443.conf" "/etc/nginx/sites-enabled/site1_80443.conf"
wait
if [ -s "/etc/nginx/sites-enabled/default" ]
then
	echo "Deleting file  nginx default config "
	rm "/etc/nginx/sites-enabled/default"
fi
wait
echo "Basic HTTP/HTTPS Website Config Download Complete"
#--- Create Filesystem  ----
mkdir "/media/data/"
mkdir "/var/www/html/"
mkdir "/var/log/nginx/"

#-- sample page --
wget -O "index.html" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/index.html"
wget -O "nginx.png" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/nginx.png"
wget -O "f5-logo-tagline-right-solid-rgb-1.png" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/f5-logo-tagline-right-solid-rgb-1.png"

#-- sample page --
sudo mv "index.html" "/var/www/html/index.html"
sudo mv "nginx.png" "/var/www/html/nginx.png"
sudo mv "f5-logo-tagline-right-solid-rgb-1.png" "/var/www/html/f5-logo-tagline-right-solid-rgb-1.png"

sudo chmod -R 755 /media/data/ && sudo chown -R www-data:www-data /media/data/
sudo chmod -R 755 /var/www/html/ && sudo chown -R www-data:www-data /var/www/html/

wait
echo "Restarting Nginx... "
/etc/init.d/nginx restart

echo "Restarting PHP-FPM... "
/etc/init.d/php7.2-fpm restart
echo "Done All! \r\n \r\n"

echo "You will need to update the NGINX config at:  /etc/nginx/sites-enabled/ \r\n \r\n"


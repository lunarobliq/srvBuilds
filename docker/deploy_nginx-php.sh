#!/bin/sh
#    If you update this from Windows, using Notepad ++, do the following:
#       sudo apt-get -y install dos2unix
#       dos2unix <FILE>
#       chmod u+x <FILE>
#
clear
now=$(date)
echo "Running deploy_nginx-php.sh at $now 


   /$$$$$$$                      /$$                          
  | $$__  $$                    | $$                          
  | $$  \ $$  /$$$$$$   /$$$$$$$| $$   /$$  /$$$$$$   /$$$$$$ 
  | $$  | $$ /$$__  $$ /$$_____/| $$  /$$/ /$$__  $$ /$$__  $$
  | $$  | $$| $$  \ $$| $$      | $$$$$$/ | $$$$$$$$| $$  \__/
  | $$  | $$| $$  | $$| $$      | $$_  $$ | $$_____/| $$      
  | $$$$$$$/|  $$$$$$/|  $$$$$$$| $$ \  $$|  $$$$$$$| $$      
  |_______/  \______/  \_______/|__/  \__/ \_______/|__/      
                                                              

Created By:
 _____ _       _     _           _              _____    __    _____             
|     | |_ ___|_|___| |_ ___ ___| |_ ___ ___   |     |__|  |  |   __|___ ___ _ _ 
|   --|   |  _| |_ -|  _| . | . |   | -_|  _|  | | | |  |  |  |  |  |  _| .'| | |
|_____|_|_|_| |_|___|_| |___|  _|_|_|___|_|    |_|_|_|_____|  |_____|_| |__,|_  |
                            |_|                                             |___|
\r\n \r\n
Version:  0.0.9                             \r\n
Last Updated:  10/1/2018
\r\n \r\n"
wait
#---------- Download config files ----------------
if [ -s "container-nginx.conf" ]
then
    echo "Deleting old files \r\n"
    rm docker-compose.yml
    rm container-nginx.conf
    rm site1.conf
    rm site1_tls.conf
    rm container-php-fpm.ini
    rm docker-compose-nginx_php.yml
    rm sysinfo.php
fi
#--- Nginx Configs
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/container-nginx.conf
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/site1.conf
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/site1_tls.conf
#--- PHP Config
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/container-php-fpm.ini

#--- Docker Deployment Config
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/docker/compose-configs/docker-compose-nginx_php.yml

#--- App Code
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/sysinfo.php
#-----------------------------------------------------------------------------------------------------------------
# create code dir and move code
if [ ! -d "code" ]
then
	sudo mkdir code
fi
cp sysinfo.php ./code/index.php
#--- rename config file to "docker-compose.yml"
mv docker-compose-nginx_php.yml docker-compose.yml
#--- start up container
docker-compose up
#docker-compose -f docker-compose-nginx_php.yml -p Webapp-Nginx-PHP
echo "Done! \r\n \r\n"

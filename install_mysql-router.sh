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
\r\n \r\n
Version:  0.0.3                             \r\n
Last Updated:  3/15/2020
\r\n \r\n"
wait
echo "Downloading required dependencies... \r\n\r\n "
#--------------------------------------------------------------------------------------------
cd ~
echo "Download latest deb from: https://dev.mysql.com/downloads/repo/apt/  \r\n \r\n"

wget -c https://dev.mysql.com/get/Downloads/MySQL-Router/mysql-router-community_8.0.19-1ubuntu18.04_amd64.deb
sudo dpkg -i mysql-router-community_8.0.19-1ubuntu18.04_amd64.deb
sudo apt-get update
sudo apt-get install -y mysql-router

echo "\r\n Downloading Config \r\n"
wget "mysql_router.conf" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/mysql_router.conf"
wait
sudo cp "mysql_router.conf" "/etc/mysqlrouter/mysql_router.conf"
wait
echo "\r\n Router Config Download Complete \r\n"

#sudo /etc/init.d/mysql-router restart
echo "\r\n \r\n \r\n \r\n"
echo -e "Edit the config:  nano /etc/mysqlrouter/mysql_router.conf \r\n \r\n "
echo -e "Then start it with:  sudo /etc/init.d/mysql-router restart  \r\n \r\n "
echo " Done! \r\n\r\n"

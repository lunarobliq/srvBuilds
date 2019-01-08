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
Version:  1.5.3                            \r\n
Last Updated:  1/8/2019
\r\n \r\n
Updating system first..."
sudo -E apt-get update
wait
sudo -E apt-get upgrade -y
wait
echo "Downloading required dependencies...\r\n\r\n"
#--------------------------------------------------------------------------------------------
sudo -E apt-get install -y build-essential libssl-dev

cd ~

# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions

# LTS
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# Latest
#curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
#--------------------------------------------------------------------------------------------
wait
sudo apt-get install -y nodejs

#echo "\r\n \r\n Installing NPM \r\n "
#sudo apt-get install -y npm
#curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
#wait
#sudo bash nodesource_setup.sh
#wait

sudo npm update npm -g

echo "Install popular NPM modules... \r\n "
sudo npm install ws --ws:native
sudo npm install bleach
sudo npm install supervisor -g
sudo npm install express connect request emailjs colors forever redis cluster
sudo npm install socket.io socket.io-redis socket.io-adapter socket.io-emitter socket.io-parser
sudo npm install socket.io --save

#-- Crypto
sudo npm install pem bcrypt aes-js md5 hash.js

#--- Comms ---
sudo npm install protobufjs grpc

#--- Optional Packages ---
sudo npm install mysql
sudo npm install mongodb
sudo npm install memcache
#sudo npm install influxdb-nodejs
sudo npm install ping traceroute

#--- Sources ---
# https://www.npmjs.com/package/protobufjs
# https://www.npmjs.com/package/hash.js

#--------------
wait
echo "Done installing Node.JS and NPM \r\n \r\n"

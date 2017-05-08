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
"
echo "\r\n \r\n"
echo "Downloading required files.."
sudo apt-get -y install unattended-upgrades
wait
sudo apt-get -y autoremove
wait
apt-get dist-upgrade -y
wait
sudo dpkg --configure -a
wait
apt-get update && apt-get upgrade -y
wait
echo "-----------------------------------------------------------------------"
echo " "
echo " "
if [ -s "50unattended-upgrades" ] then
  echo "Downloading latest custom config's "
  wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/50unattended-upgrades
  wait
  cp 50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades
  echo "Done setting up AutoUpdates!"
  echo " "
  echo " "
  echo " "
fi
echo "----------------------------------------------"
wait
sudo apt-get autoclean
wait
sudo apt-get -y autoremove
wait
echo "Done "
echo " "
echo " "
echo " To add to cron use the following: "
echo " crontab -e"
echo " 15 4 6 * * /home/ubuntu/update-ubuntu14.04.sh >/dev/null 2>&1"
echo " /etc/init.d/cron restart "
echo " "
echo " "

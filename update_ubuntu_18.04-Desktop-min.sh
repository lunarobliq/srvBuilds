#!/bin/sh
#    If you update this from Windows, using Notepad ++, do the following:
#       sudo apt-get -y install dos2unix
#       dos2unix <FILE>
#       chmod u+x <FILE>
#
clear
now=$(date)
echo "Running update_ubuntu_18.04-Desktop-min.sh at $now 
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
Last Updated:  10/22/2019
\r\n \r\n"
wait

# Ubuntu 18.04 setup with min install

sudo apt-get update
sudo apt install net-tools curl ssh

#-- VNC Server
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-18-04
sudo apt-get install -y vnc4server vnc-java x11-xfs-utils tightvncserver tightvnc-java
# vncserver
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak

 #!/bin/bash
 xrdb $HOME/.Xresources
 startxfce4 &

sudo chmod +x ~/.vnc/xstartup

echo "to CHECK the status of VNC Server use:    netstat -tulpn   \r\n \r\n"
echo "To KILL VNCServer use:  vncserver -kill :1  \r\n \r\n"
echo "set VNC Password: vncpasswd  \r\n \r\n"





#--- Optional ---
sudo apt install linux-generic-hwe-18.04 linux-headers-generic-hwe-18.04 linux-image-generic-hwe-18.04

#Password too long - only the first 8 characters will be used
sudo vncserver

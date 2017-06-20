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
Version:  1.2                             \r\n
Last Updated:  5/31/2017
\r\n \r\n
#Updating system first..."
#sudo -E apt-get update
#wait
#sudo -E apt-get upgrade -y
wait
echo "Downloading required dependencies...\r\n\r\n"
#--------------------------------------------------------------------------------------------
rm snmpd.conf
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/snmpd.conf
wait
chmod u+x snmpd.conf
wait
sudo apt-get install -y libperl-dev snmp lm-sensors fancontrol sensord read-edid i2c-tools rrdtool libi2c-dev python-smbus librrds-perl unzip zip snmpd
wait
echo "deb http://nova.clouds.archive.ubuntu.com/ubuntu trusty main multiverse" >> /etc/apt/sources.list
wait
sudo apt-get update -y
wait
sudo apt-get install -y snmp-mibs-downloader
wait
sudo download-mibs
wait
wget http://sourceforge.net/projects/net-snmp/files/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz 
wait
tar -xvzf net-snmp-5.7.3.tar.gz
wait
mv net-snmp-5.7.3 net-snmp
wait
cd net-snmp
wait
./configure --with-default-snmp-version="3" --with-sys-contact="someuser@company.com" --with-sys-location="NDC_Server1" --with-logfile="/var/log/snmpd.log" --with-persistent-directory="/var/net-snmp"
wait

# Move Sample snmp.conf to the correct location
cp snmpd.conf /etc/snmp/snmpd.conf
wait
/etc/init.d/snmpd restart
wait

echo "DONE! \r\n \r\n"
echo "To edit, enter the following: \r\n"
echo "nano /etc/snmp/snmpd.conf"
echo "\r\n \r\n"

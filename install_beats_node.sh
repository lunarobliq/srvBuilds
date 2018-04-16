
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

https://www.elastic.co/guide/index.html

https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_beats.sh

This really is meant to be run under Ubuntu 14.04 - 16.04 LTS +
\r\n \r\n
Version:  0.0.8                             \r\n
Last Updated:  4/14/2018
\r\n \r\n"

if [ -z "$1" ]
   then
      version=6.2.3
else
      version=$1
fi
echo "Installing version: $version \r\n"

echo -e "Installing Packetbeat \r\n  https://www.elastic.co/guide/en/beats/packetbeat/current/packetbeat-getting-started.html  \r\n \r\n"
sudo apt-get -y install libpcap0.8
curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-$version-amd64.deb
sudo dpkg -i packetbeat-$version-amd64.deb


echo -e "Installing Filebeat \r\n https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-getting-started.html \r\n \r\n"
curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$version-amd64.deb
sudo dpkg -i filebeat-$version-amd64.deb
wait

echo -e "Installing MetricBeat \r\n https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-getting-started.html \r\n \r\n"
curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-$version-amd64.deb
sudo dpkg -i metricbeat-$version-amd64.deb

echo -e "Installing HeartBeat \r\n hhttps://www.elastic.co/guide/en/beats/heartbeat/current/heartbeat-installation.html \r\n \r\n"
curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-$version-amd64.deb
sudo dpkg -i heartbeat-$version-amd64.deb


echo -e "Installing AuditBeat \r\n https://www.elastic.co/guide/en/beats/metricbeat/current/auditbeat-getting-started.html \r\n \r\n"
curl -L -O https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-$version-amd64.deb
sudo dpkg -i auditbeat-$version-amd64.deb



echo "DONE! \r\n \r\n"
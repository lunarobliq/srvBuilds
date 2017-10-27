
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

https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_elasticsearch5x.sh
This really is meant to be run under Ubuntu 14.04 - 16.04 LTS +
\r\n \r\n
Version:  0.1.5                             \r\n
Last Updated:  10/27/2017
\r\n \r\n"

echo -e "Installing Java...  \r\n \r\n "
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer


echo -e "Installing Elastic Search 5.X \r\n \r\n"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt-get install -y apt-transport-https

echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

sudo apt-get update

sudo apt-get install -y elasticsearch

echo -e "Adding: ulimit -n 65536  \r\n \r\n "
ulimit -n 65536
echo "elasticsearch  -  nofile  65536" >> /etc/security/limits.conf 


echo "downloading optimized config...  \r\n \r\n "

if [ -s "/etc/elasticsearch/logging.yml" ]
then
	echo "Deleting file  logging.yml "
	rm /etc/elasticsearch/logging.yml
fi

mv /etc/elasticsearch/elasticsearch.yml  /etc/elasticsearch/elasticsearch_backup.yml
wait
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/elasticsearch-5x.yml
wait
cp elasticsearch-5x.yml /etc/elasticsearch/elasticsearch.yml
wait
echo " Restarting ElasticSearch... \r\n \r\n "
sudo /etc/init.d/elasticsearch restart


echo "DONE! \r\n \r\n"

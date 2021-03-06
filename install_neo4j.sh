
#!/bin/sh
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


This really is meant to be run under Ubuntu 16.04 - 18.04 LTS +
\r\n \r\n
Version:  0.0.5                             \r\n
Last Updated:  3/15/2020
\r\n \r\n"

#--- Java is required for Neo4j --------
echo -e "Installing Java (OpenJRE & OpenJDK 11)...  \r\n \r\n "
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update

sudo apt -y install default-jre
sudo apt -y install default-jdk
wait

#-----------------------------------------------------------------------

#wget --no-check-certificate -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -

echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list

sudo -E apt update
sudo -E apt install -y neo4j

sudo -E systemctl start neo4j
sudo -E systemctl enable neo4j

sudo systemctl status neo4j
#-------------------------

echo "DONE! \r\n \r\n"

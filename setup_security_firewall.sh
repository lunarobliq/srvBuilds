sudo apt-get install wget git nano ufw
sudo apt-get update

#---------------------------------------------------------------------------------------------------------
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 8888
sudo ufw allow 80/tcp
sudo ufw allow 80/udp
sudo ufw allow 443/tcp
sudo ufw allow 443/udp
sudo ufw allow 8888/tcp
sudo ufw allow 8888/udp
sudo ufw allow 3000
sudo ufw allow 3000/tcp
sudo ufw allow 3000/udp
sudo ufw allow 123
sudo ufw allow 123/tcp
sudo ufw allow 123/udp

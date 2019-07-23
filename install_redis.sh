#!/bin/sh
#    If you update this from Windows, using Notepad ++, do the following:
#       sudo apt-get -y install dos2unix
#       dos2unix <FILE>
#       chmod u+x <FILE>
#
clear
now=$(date)
echo "Running install_redis.sh at $now 

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
Version:  0.0.7                             \r\n
Last Updated:  7/22/2019
\r\n \r\n"
wait
sudo -E apt-get update
wait
sudo -E apt-get upgrade -y --force-yes
wait
sudo -E apt-get install -f -y
wait
echo "Freeing up space"
sudo apt-get autoremove -y
wait
echo "Downloading required dependencies...\r\n\r\n"
#--------------------------------------------------------------------------------------------

echo "This installs redis-server to your box... \r\n"
sudo add-apt-repository -y ppa:chris-lea/redis-server
wait
sudo -E apt-get update
wait
sudo -E apt-get install -y build-essential tcl
wait
sudo -E apt-get install -y redis-server
#pip install redis-trib
wait
clear
echo "\r\n \r\n "
echo "Fixing environment settings... \r\n \r\n"
echo "fixing the: WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. \r\n";
#sudo sysctl vm.overcommit_memory=1
sudo echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf
wait
#echo "Fixing the: WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128. \r\n"

echo "Fixing WARNINGS / Issues with other platforms... \r\n \r\n"
sudo echo "sysctl -w net.core.somaxconn=65535" >> /etc/rc.local
sudo echo 65534 > /proc/sys/net/core/somaxconn
sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled

wait
#  WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run
if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
    sudo echo never > /sys/kernel/mm/transparent_hugepage/enabled
fi
if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
    sudo echo never > /sys/kernel/mm/transparent_hugepage/defrag
fi
wait
echo "\r\n Running benchmark before custom config gets downloaded... If this fails, please edit the command and add password. https://redis.io/topics/benchmarks \r\n"
redis-benchmark -q -n 1000 -c 10 -P 5
wait
echo "\r\n \r\n Creating Autostart script... \r\n"
touch /etc/init/redis-server.conf
sudo echo 'description "redis server"' > /etc/init/redis-server.conf
sudo echo 'start on runlevel [23]' >> /etc/init/redis-server.conf
sudo echo 'stop on shutdown' >> /etc/init/redis-server.conf
sudo echo 'exec sudo -u redis /usr/bin/redis-server /etc/redis/redis.conf' >> /etc/init/redis-server.conf
sudo echo 'respawn' >> /etc/init/redis-server.conf
echo "----------------------------------------------------------------------- \r\n"
echo "Downloading latest custom config... \r\n "
wait
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/redis_cluster.conf
#wait
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/redis_standalone.conf
wait
#wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/configs/redis_slave.conf
#wait

echo "Making backups and copies.. \r\n \r\n"

sudo mkdir /var/run/redis/
sudo chown redis /var/run/redis/ && sudo chmod u+x /var/run/redis/

sudo mkdir /var/log/redis/
sudo chown redis /var/log/redis/ && sudo chmod u+x /var/log/redis/

#-- non human editable cluster node file --
touch /etc/redis/cluster_nodes.conf
sudo chown redis /etc/redis/cluster_nodes.conf && sudo chmod u+x /etc/redis/cluster_nodes.conf

mv /etc/redis/redis.conf /etc/redis/redis_orginal.conf
wait
mv redis_cluster.conf /etc/redis/redis.conf
#wait
mv redis_standalone.conf /etc/redis/redis_standalone.conf
#wait
#mv redis_slave.conf /etc/redis/redis_slave.conf
wait
echo "\r\n Starting.... \r\n \r\n "

sudo /etc/init.d/redis-server restart
echo "\r\n \r\n Running benchmark again. https://redis.io/topics/benchmarks \r\n \r\n"
redis-benchmark -q -n 1000 -c 10 -P 5
echo "\r\n \r\n"
echo "--------------------------------------------------------------------"
echo "To test, issue the following commands: "
echo " redis-benchmark -q -n 1000 -c 10 -P 5 "
echo " "
echo " redis-cli -a <password>"
echo "      >  info"
echo " "
echo " /usr/bin/redis-server /etc/redis/redis.conf"
echo "\r\n \r\n"
#wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_ruby.sh && chmod u+x install_ruby.sh && ./install_ruby.sh
#gem install redis
#wget http://download.redis.io/redis-stable/src/redis-trib.rb && chmod u+x redis-trib.rb && ./redis-trib.rb

echo "Done!"

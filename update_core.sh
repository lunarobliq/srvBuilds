#!/bin/bash
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
Version:  1.3.2                             \r\n
Last Updated:  10/6/2017
\r\n \r\n
Updating system first..."
#sudo -E apt-get update
wait
#sudo -E apt-get upgrade -y
#wait
#echo "Freeing up space"
#sudo apt-get autoremove -y
wait
#echo "Downloading required dependencies...\r\n\r\n"
#--------------------------------------------------------------------------------------------
ping -q -c5 github.com > /dev/null
if [ $? -eq 0 ]
 	echo "Not connected to internet. Fix that first and try again"
then
	echo "Connected to internet! "
	echo "Downloading files..."
	if [ -s "sys_cleanup.sh" ] 
	then
		echo "Deleting files"
		rm sys_cleanup.sh
 		rm update_ubuntu14.04.sh
 		rm install_common.sh
		rm update_core.sh
	fi

	echo "Downloading latest versions..."

	wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/update_core.sh
	wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/sys_cleanup.sh
	wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/update_ubuntu14.04.sh
	wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_common.sh
	wait
	chmod u+x sys_cleanup.sh 
	chmod u+x update_ubuntu14.04.sh
	chmod u+x install_common.sh
	chmod u+x update_core.sh
	
	sh ./update_ubuntu14.04.sh
fi
echo "done! \r\n \r\n"

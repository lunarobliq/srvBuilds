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
Version:  0.2.3                             \r\n
Last Updated:  5/19/2018
\r\n \r\n
Updating system first..."
sudo -E apt-get update
wait
sudo -E apt-get upgrade -y
wait
echo "Downloading required dependencies...\r\n\r\n"
#--------------------------------------------------------------------------------------------
echo "Installing Ansible 2 (REPO) \r\n \r\n"

#------------- Version Detection -------------
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi
echo " Detected: OS: $OS, Version: $VER \r\n \r\n"
#-----------------------------------------------
#if [ $VER = '14.04' ] || [ $VER = '16.04' ]; then
#    sudo add-apt-repository ppa:deadsnakes/ppa
#    sudo apt-get update
#elif [ $VER = '16.10' ] || [ $VER = '17.04' ]; then
#    sudo apt-get install python3.6
#elif [ $VER = '17.10' ] || [ $VER = '18.04' ]; then
#    echo "Python3 already installed"
#fi


sudo -E apt-get install -y pip
pip install --upgrade pip
sudo -E apt-get install -y install python-jinja2 python-paramiko python-yaml sshpass

#---- Install using Repo -----
sudo -E apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo -E apt-get update
#sudo -E apt-get install -y ansible

pip install ansible jinja2 pyaml

#---- the rest ----
wait
echo "\r\n \r\n"

which ansible
echo "\r\n \r\n"
ansible --version
echo "\r\n \r\n"
#-------------
wait
echo "\r\n Now you might want to run: ssh-keygen to generate your ssh key \r\n "
echo "Done!"
echo "\r\n \r\n "

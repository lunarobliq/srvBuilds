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
Version:  1.7                             \r\n
Last Updated:  8/16/2017
\r\n \r\n
Updating system first..."
sudo -E apt-get update
wait
sudo -E apt-get upgrade -y
wait
echo "Downloading required dependencies...\r\n\r\n"
#--------------------------------------------------------------------------------------------

echo "SSL / TLS Testing...\r\n\r\n"

echo "pinging Google DNS by IP (4 times)... "
ping -c 4 8.8.8.8

echo "\r\n\r\n"

echo "ping google via DNS (4 times)... "
ping -c 4 google.com

echo "\r\n\r\n"

echo "traceroute to GoogleDNS"
traceroute 8.8.8.8
echo "\r\n\r\n"

echo "traceroute to GoogleDNS via URL"
traceroute google.com
echo "\r\n\r\n"

echo "CURL to SSLiTest.com by IP... "
curl https://52.8.66.32 -k

echo "\r\n\r\n"

echo "CURL SSLiTest.com via DNS... "
curl https://sslitest.com/

echo "\r\n\r\n"

echo "DIG GoogleDNS via DNS... "
dig @8.8.8.8 google.com

echo "\r\n\r\n"

echo "DIG GoogleDNS via IP... "
dig 8.8.8.8

echo "\r\n\r\n"
echo "------------------------------------------------------------------------"
echo "\r\n\r\n"
echo "Downloading webpages  ( These should be bypassed from SSL Decrypt)..."


echo "Fidelity.com......."
if [ -s "Fidelity.html" ] 
then
	echo "Deleting file  Fidelity.html "
	rm Fidelity.html
fi
wget -O Fidelity.html 'https://www.fidelity.com/'
wait
echo "\r\n\r\n"

echo "BankofAmerica.com......."
if [ -s "BankofAmerica.html" ] 
then
	echo "Deleting file  BankofAmerica.html "
	rm BankofAmerica.html
fi
wget -O BankofAmerica.html 'https://www.bankofamerica.com/'
wait
echo "\r\n\r\n"

#-------------------------------------------------------------

echo "BlueCrossBlueShield.com  (bcbs.com)..."
if [ -s "BlueCrossBlueShield.html" ]
then
	echo "Deleting file  BlueCrossBlueShield.html "
	rm BlueCrossBlueShield.html
fi
wget -O BlueCrossBlueShield.html 'https://www.bcbs.com/'
wait
echo "\r\n\r\n"

echo "wageworks.com......."
if [ -s "wageworks.html" ] 
then
	echo "Deleting file  wageworks.html "
	rm wageworks.html
fi
wget -O wageworks.html 'https://www.wageworks.com/'
wait
echo "\r\n\r\n"


echo "\r\n\r\n"
echo "------------------------------------------------------------------------"
echo "\r\n\r\n"


echo "Downloading files tests......."
echo "\r\n\r\n"


echo "salesforce.com......."
if [ -s "salesforce.html" ] 
then
	echo "Deleting file salesforce.html "
	rm salesforce.html
fi
wget -O salesforce.html 'https://www.salesforce.com/editions-pricing/sales-cloud/'
wait
echo "\r\n\r\n"


echo "GitHub File......."
if [ -s "chris_github.jpg" ] 
then
	echo "Deleting file  chris_github.jpg "
	rm chris_github.jpg
fi
wget -O chris_github.jpg 'https://raw.githubusercontent.com/c2theg/srvBuilds/master/20150503_102930.jpg'
wait
echo "\r\n\r\n"


echo "Google Drive file......."
if [ -s "chris_gdrive.jpg" ] 
then
	echo "Deleting file  chris_gdrive.jpg "
	rm chris_gdrive.jpg
fi
wget -O chris_gdrive.jpg 'https://goo.gl/niOFPb'
wait
echo "\r\n\r\n"

echo "Apple iCloud file......."
if [ -s "chris_icloud.jpg" ] 
then
	echo "Deleting file  chris_icloud.jpg"
	rm chris_icloud.jpg
fi
wget -O chris_icloud.jpg 'https://goo.gl/iBX2zs'
wait
echo "\r\n\r\n"


echo "One Drive file......."
if [ -s "chris_onedrive.jpg" ] 
then
	echo "Deleting file  chris_onedrive.jpg "
	rm chris_onedrive.jpg
fi
wget -O chris_onedrive.jpg 'https://goo.gl/vUYUod'
wait
echo "\r\n\r\n"


echo "One Drive file Ubuntu 16.04 Server (829Mb this will take some time)......."
if [ -s "ubuntu1604.iso" ] 
then
	echo "Deleting file  ubuntu1604.iso "
	rm ubuntu1604.iso
fi
# Get link from this site: http://metadataconsulting.blogspot.com/2014/05/how-to-get-direct-download-link-from.html

wget -O ubuntu1604.iso 'https://onedrive.live.com/download?cid=F9861CD584CF2680&resid=F9861CD584CF2680%21480&authkey=AAuqbwXa3GMmuwM'
wait
echo "\r\n\r\n"

ls -ltrh

echo "\r\n\r\n"

echo "ALL DONE!!!"

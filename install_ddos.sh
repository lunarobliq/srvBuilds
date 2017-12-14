
#---- ExaBGP  https://github.com/Exa-Networks/exabgp  ------
pip install --upgrade pip
pip install exabgp

#------- Scanning & Info ---------------------
apt-get install -y zmap nload traceroute htop whois hping3 tcl8.6
wait
wget "install_nmap-git.sh" "https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_nmap-git.sh" && chmod u+x install_nmap-git.sh && ./install_nmap-git.sh
wait

#--- fastnetmon -----  https://github.com/pavel-odintsov/fastnetmon/blob/master/docs/INSTALL.md
wget https://raw.githubusercontent.com/pavel-odintsov/fastnetmon/master/src/fastnetmon_install.pl -Ofastnetmon_install.pl
wait 
sudo perl fastnetmon_install.pl
#----------------------------------------------------------------------------------------------------------

### Examples ###

# hping3 -V -c 1000000 -d 120 -S -w 64 -p 443 -s 443 --flood --rand-source 10.1.1.1
# hping3 -2 -c 1000000 -s 5151 -p 80  --rand-source 10.1.1.1


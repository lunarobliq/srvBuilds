A set of shell scripts I use to deploy various ubuntu servers.

<h1>TL:DR;  - run the following and all your problems will be solved :)</h1>

<h2> wget http://bit.ly/2wiGV4n && mv 2wiGV4n update_core.sh && chmod u+x update_core.sh && ./update_core.sh </h2>


Other Short URLs <br /><br />
<b>---------- Installers ------------------</b>
<br /><br />

<b>Ansible Host </b><br />
wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_ansible-host.sh && chmod u+x install_ansible-host.sh && ./install_ansible-host.sh

<br /><br />

wget https://bit.ly/cgray-lemp && mv cgray-lemp install_lemp.sh && chmod u+x install_lemp.sh && ./install_lemp.sh

wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_percona_5.7.sh && chmod u+x install_percona_5.7.sh && ./install_percona_5.7.sh

wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/install_btsync.sh && chmod u+x install_btsync.sh && ./install_btsync.sh


------------------------------------------
once downloaded do the following:

chmod u+x < FILENAME >

sudo ./< FILENAME >


Thats it

----  Cronjob -------------------------------------------------

<br /> <br />
<b> To add to cron use the following: </b> <br /> <br />
crontab -e   <br /> <br />
10 3 * * * /home/ubuntu/update_core.sh >> /var/log/update_core.log 2>&1   <br />
40 4 * * * /home/ubuntu/update_ubuntu14.04.sh >> /var/log/update_ubuntu.log 2>&1    <br />
20 4 * * 7 /home/ubuntu/sys_cleanup.sh >> /var/log/sys_cleanup.log 2>&1   <br />
@reboot /home/ubuntu/update_core.sh >> /var/log/update_core.log 2>&1    <br />

 <br /> <br /> <b> Then restart cron:  </b><br />
/etc/init.d/cron restart

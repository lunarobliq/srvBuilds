A set of shell scripts I use to deploy various ubuntu servers.


Short URLs

---------- Installers ------------------

wget https://bit.ly/cgray-common

wget https://bit.ly/cgray-lemp

wget https://bit.ly/cgray-webmin

--------- Updaters -----------------------

wget http://bit.ly/cgray-updateU1404  && mv cgray-updateU1404 update_ubuntu14.04.sh  && chmod u+x update_ubuntu14.04.sh && ./update_ubuntu14.04.sh

------------------------------------------

once downloaded do the following:

chmod u+x < FILENAME >

sudo ./< FILENAME >


Thats it

All else fail's... force update core!

rm update_core.sh && wget https://raw.githubusercontent.com/c2theg/srvBuilds/master/update_core.sh && chmod u+x update_core.sh && ./update_core.sh

----  Cronjob -------------------------------------------------

10 3 * * * /home/ubuntu/update_core.sh >> /var/log/update_core.log 2>&1

40 4 * * * /home/ubuntu/update_ubuntu14.04.sh >> /var/log/update_ubuntu.log 2>&1

20 4 * * 7 /home/ubuntu/sys_cleanup.sh >> /var/log/sys_cleanup.log 2>&1

/etc/init.d/cron restart

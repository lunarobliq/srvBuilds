mysql --user=root --password=<Password> -e "STOP SLAVE; SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1; START SLAVE; SHOW SLAVE STATUS;"

echo " "
echo " "
echo "To fix this on startup, add the following to crontab"
echo " "
echo "@reboot /home/ubuntu/fix_mysql_replication.sh >> /var/log/fix_mysql_replication.log 2>&1"
echo " "
echo " "

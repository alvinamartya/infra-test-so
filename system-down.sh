#!/bin/sh
# prog : system-down.sh

while true; do

db=mysql;
web=nginx;
currDate="$(date)";
dbStatus=$(ps -ef | grep -v grep | grep $db | wc -l);
webStatus=$(ps -ef | grep -v grep | grep $web | wc -l);

if [ $dbStatus -lt 1 ]
then
echo "$currDate, $db service is down." >> /home/kelompok9/log.txt
echo "Service Down" | mail -s "$db service is down, restart the service !" sekolah.anakb@gmail.com
tail -f /var/log/mail.log
fi

if [ $webStatus -lt 1 ]
then
echo "$currDate, $web service is down." >> /home/kelompok9/log.txt
echo "Service Down" | mail -s "$web service is down, restart the service !" sekolah.anakb@gmail.com
tail -f /var/log/mail.log
fi

# web server check
if (( $(ps -ef | grep -v grep | grep $web | wc -l) < 1))
then
echo "$currDate, $web service is down." >> /home/ubuntu/log.txt
echo "================================================"
echo "$web service is down, restart the service !"
echo "================================================"
fi

sleep 300;
done

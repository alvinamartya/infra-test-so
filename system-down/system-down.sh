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
. /script-send-mail.sh
fi

if [ $webStatus -lt 1 ]
then
echo "$currDate, $web service is down." >> /home/kelompok9/log.txt
echo "Service Down" | mail -s "$web service is down, restart the service !" sekolah.anakb@gmail.com
. /script-send-mail.sh
fi

sleep 300;
done

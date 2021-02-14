#!/bin/sh
# prog : system-down.sh

while true; do

db=mysql;
web=nginx;
currDate="$(date)"

# db check
if (( $(ps -ef | grep -v grep | grep $db | wc -l) < 1))
then
echo "$currDate, $db service is down." >> /home/ubuntu/log.txt
echo "================================================"
echo "$db service is down, restart the service !"
echo "================================================"
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

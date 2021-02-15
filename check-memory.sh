#!/bin/sh
# prog: check-memory.sh

memUse=$(free -m | grep Mem | awk '{print $3}')
memTotal=$(free -m | grep Mem | awk '{print $2}')

memPercent=`expr $memUse \* 100 / $memTotal`
limit=80

if [ $memPercent -ge $limit ]
then
echo "<------- MemUse ------->"
echo "Memory usage is $memPercent%"
echo "Memory Usage" | mail -s "Memory Usage more than 80%" sekolah.anakb@gmail.com
tail -f /var/log/mail.log
fi

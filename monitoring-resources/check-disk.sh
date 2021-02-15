#!/bin/sh
# prog: check-disk.sh

diskUse=`df -m | awk '/dev/sda1 tmpfs udev { sum+=$3 } END { print sum }'`
diskTotal=`df -m | awk '/dev/sda1 tmpfs udev { sum+=$2 } END { print sum }'`

diskPercent=`expr $diskUse \* 100 / $diskTotal`
limit=80

if [ $diskPercent -ge $limit ]
then
echo "Disk Usage : $diskPercent%"
echo "Disk Usage" | mail -s "Disk Usage more than 80%" sekolah.anakb@gmail.com
. /script-send-mail.sh
fi

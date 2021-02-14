#!/bin/sh
# prog : check-cpu.sh

cpu=`top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`

cpuPercent=`echo $cpu | cut -d. -f1`
limit=80

if [ $cpuPercent -ge $limit ]
then
echo "<------- CheckCPU ------->"
echo "CPU Usage : $cpuPercent%"
echo "CPU Usage more than 80%"
fi

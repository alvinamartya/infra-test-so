#!/bin/sh
# prog: monitoring-resources.sh

while true; do

. checkMemory.sh
. checkCPU.sh
. checkDisk.sh

done

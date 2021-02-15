#!/bin/bash
tail -f /var/log/mail.log > out 2>&1 & # running tail at background
tailpid=$! # get tailpid
sleep=10 # sleep 10 seconds
kill $tailpid
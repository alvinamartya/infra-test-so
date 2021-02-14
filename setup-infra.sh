#!/bin/bash
# prog : setup-infra.sh

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# install required apps
apt install -y nginx mysql-server
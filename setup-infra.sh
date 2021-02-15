#!/bin/bash
# prog : setup-infra.sh

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# install required apps
apt install -y nginx mysql-server php-fpm php-mysql composer php-json php-xmlrpc php-curl php-gd php-xml php-mbstring

# remove original content
rm -rf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/*

# copy content from repo
cp -R nginx/sites-available/. /etc/nginx/sites-available/
cp -R nginx/sites-available/. /etc/nginx/sites-enabled/

# restart nginx
systemctl restart nginx
#!/bin/bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

# install wordpress
wget https://wordpress.org/latest.tar.gz


# extract wordpress
tar zxf latest.tar.gz

# move wordpress to /var/www/html
mv wordpress /var/www/html/

# clean up
rm latest.tar.gz

# permission
chown -R www-data:www-data /var/www
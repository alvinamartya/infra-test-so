#!/bin/bash
# prog : send-mail.sh

apt-get install mailutils
apt-get install postfix

# nano /etc/postfix/main.cf
# relayhost = [smtp.gmail.com]:587
# # Enable SASL authentication
# smtp_sasl_auth_enable = yes
# # Disallow methods that allow anonymous authentication
# smtp_sasl_security_options = noanonymous
# # Locaiton of sasl_passwd
# smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd
# #Enable Startils encryption
# smtp_tls_security_level = encrypt
# # Location of CA certificates
# smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt

# vi /etc/postfix/sasl/sasl_passwd
# [smtp.gmail.com]:587 sekolah.anakb@gmail.com:Sekolah12!

postmap /etc/postfix/sasl/sasl_passwd
mkfifo /var/spool/postfix/public/pickup
service postfix restart
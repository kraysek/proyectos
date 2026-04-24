#!/bin/bash
# This will remove Apache
#service apache2 stop
#apt-get purge apache2 apache2-utils apache2.2-bin 
#apt remove apache2.*
#apt-get autoremove
#whereis apache2
#rm -rf /etc/apache2

# This will remove PHP version. Type your php version before run below command. I am using php7.4
apt-get purge `dpkg -l | grep php7.4| awk '{print $2}' |tr "\n" " "`
apt-get purge php7.*
apt-get autoremove --purge
whereis php
rm -rf /etc/php

# This will remove MYSql
service mysql stop
apt-get remove --purge *mysql\*
apt-get remove --purge mysql-server mysql-client mysql-common -y
rm -rf /etc/mysql
apt-get autoremove
apt-get autoclean

# reboot






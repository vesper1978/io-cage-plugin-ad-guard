#!/bin/sh

# Prepare the system

pw useradd -n adguard -m -c "Ad Guard Home user" -s /usr/sbin/nologin -w no
mkdir -p /home/adguard/.config/adguard
chown -R adguard:adguard /home/adguard/

cd /home/adguard/.config/adguard && fetch https://static.adguard.com/adguardhome/release/AdGuardHome_freebsd_amd64.tar.gz && gunzip AdGuardHome_freebsd_amd64.tar.gz && tar xf AdGuardHome_freebsd_amd64.tar && rm AdGuardHome_freebsd_amd64.tar
# Configure the services
sysrc -f /etc/rc.conf adguardhome_enable="YES"
sysrc -f /etc/rc.conf adguardhome_user="adguard"

# Create pid folder
mkdir /var/run/adguard
touch /var/run/adguard/pid
chown -R adguard:adguard /var/run/adguard/

# Move config
chown -R adguard:adguard /home/adguard/


# Start Ad Guard
service adguard start


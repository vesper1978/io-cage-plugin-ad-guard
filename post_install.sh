#!/bin/sh

# Prepare the system

pw useradd -n adguard -m -c "Ad Guard Home user" -s /usr/sbin/nologin -w no
mkdir -p /home/adguard/.config/adguard
chown -R adguard:adguard /home/adguard/

cd /home/adguard/.config/adguard && fetch https://static.adguard.com/adguardhome/release/AdGuardHome_freebsd_amd64.tar.gz

tar zxvf AdGuardHome_freebsd_amd64.tar.gz

# Configure the services
sysrc -f /etc/rc.conf adguardhome_enable="YES"
sysrc -f /etc/rc.conf adguardhome_enable="adguard"

# Start Ad Guard
service adguard start


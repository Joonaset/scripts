#!/bin/bash

# This script checks if you are connected to your home network
# and changes crontab accordingly
read -s "Home network (SSID): " SSID
read -s "Cron user: " CRON_USER

CHECK=`nmcli | grep ${SSID}$`
if [ -z "$CHECK" ] ; then
  sed -i -e 's/home.sh/away.sh/g' /var/spool/cron/${CRON_USER}
else
  sed -i -e 's/away.sh/home.sh/g' /var/spool/cron/${CRON_USER}
fi


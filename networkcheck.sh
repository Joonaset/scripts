#!/bin/bash

# This script checks if you are connected to your home network
# and changes crontab accordingly
CHECK=`nmcli | grep (Your home network SSID here)$`
if [ -z "$CHECK" ] ; then
  sed -i -e 's/home.sh/away.sh/g' /var/spool/cron/(USER)
else
  sed -i -e 's/away.sh/home.sh/g' /var/spool/cron/(USER)
fi


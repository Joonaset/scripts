#!/bin/bash

# This script checks if you are connected to your home network
CHECK=`nmcli | grep (Your home network SSID here)$`
if [ -z "$CHECK" ] ; then
  ~/.scripts/sfwwallpaper.sh
  echo "*/10 * * * *  DISPLAY=:0 ~/.scripts/sfwwallpaper.sh" > /var/spool/cron/(USER)
  echo "*/5 * * * * ~/.scripts/networkcheck.sh" >> /var/spool/cron/(USER)
else
  echo "*/10 * * * *  DISPLAY=:0 ~/.scripts/nsfwwallpaper.sh" > /var/spool/cron/(USER)
  echo "*/5 * * * * ~/.scripts/networkcheck.sh" >> /var/spool/cron/(USER)
fi


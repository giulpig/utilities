#!/bin/sh

pkill gstuff & \
gstuff --noti "$(date +'%d/%m/%y %R')" " "\
      "$(set -- $(sensors | grep -i core | tr -d "+"); printf '%s\n' "CPU: $4")" " "\
      "Batteria0: $(cat /sys/class/power_supply/BAT0/capacity)%"\
      "Batteria1: $(cat /sys/class/power_supply/BAT1/capacity)%" " "\
      "Schermo: $(light | cut -f1 -d'.')%"\
      "Volume:  $(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"

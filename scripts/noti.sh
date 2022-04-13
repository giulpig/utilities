#!/bin/sh
# Info sul sistema in stile notifica (chi ha bisogno di una status bar?)
# Riccardo Palombo - https://riccardo.im
# Preparato per la community Patreon: patreon.com/riccardopalombo

pkill herbe & \
herbe "$(date +'%d/%m/%y %R')" " "\
 		" "\
      "$(set -- $(sensors | grep -i core | tr -d "+"); printf '%s\n' "CPU: $4")" " "\
      "Batteria0: $(cat /sys/class/power_supply/BAT0/capacity)%" " "\
      "Batteria1: $(cat /sys/class/power_supply/BAT1/capacity)%" " "\
			"Schermo: $(light | cut -f1 -d'.')%"
#!/usr/bin/bash
sleep 0.3
pkill herbe
xset q | grep Caps | tr -s ' ' | cut -d ' ' -f 5 | xargs herbe CapsLock
#!/bin/bash
xdotool key Caps_Lock
setxkbmap -option ctrl:nocaps
sleep 0.3
pkill herbe &\
herbe "CapsLock `xset q | grep Caps | tr -s ' ' | cut -d ' ' -f 5`"

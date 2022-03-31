#!/usr/bin/bash
#xdotool key Caps_Lock
sleep 0.1
xset q | grep Caps | tr -s ' ' | cut -d ' ' -f 5 | xargs notify-send CapsLock

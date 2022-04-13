#!/bin/sh

a=$(pgrep -f xpytile)

if [[ -n "$a" ]] 
then
	pkill herbe &
	herbe Tiling OFF
	kill $a
else
	pkill herbe &
	herbe Tiling ON
	xpytile
fi


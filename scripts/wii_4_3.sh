ffplay /dev/video2 -standard pal -fast -vf "eq=gamma=0.65:saturation=1.4:contrast=0.8" & ffplay -f alsa hw:2 -autoexit -nodisp -af 'volume=0.1'

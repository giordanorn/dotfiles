#!/bin/sh

# get a random file
WALLPAPER=$(find /usr/local/share/backgrounds | shuf | head -n1) 

# suspend notification daemon
pkill -STOP dunst

pgrep -x i3lock || \
	i3lock \
		--force-clock \
		--datestr="%A %B %e" \
		--line-uses-inside \
		--image=$WALLPAPER \
		--ignore-empty-password \
		--indicator \
		--insidecolor=282828ff \
		--timecolor=eeeeeeff \
		--datecolor=eeeeeeff \
		--ringcolor=f22c40ff \
		--keyhlcolor=eeeeeeff \
		--bshlcolor=282828ff \
		--separatorcolor=eeeeeeff \
		--time-font='Open Sans:style=Bold' \
		--date-font='Open Sans:style=Bold' \
		--timesize=32 \
		--datesize=16 \
		--ring-width=4 \
		--radius=120 \
		--veriftext="" \
		--wrongtext="" \
		--noinputtext="" \

# resume notification daemon
pkill -CONT dunst

#!/bin/sh

## get a random file
#WALLPAPER=$(find /usr/local/share/backgrounds | shuf | head -n1) 

# get current wallpaper set by feh
WALLPAPER=$(cat "$HOME/.fehbg" | grep feh | awk '{ print $4 }' | tr -d \') 

# suspend notification daemon
pkill -u "$USER" -USR1 dunst

pgrep -x i3lock || \
	i3lock \
		--nofork \
		--force-clock \
		--datestr="%A %B %e" \
		--line-uses-inside \
		--image="$WALLPAPER" \
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
pkill -u "$USER" -USR2 dunst

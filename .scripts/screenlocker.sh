#!/bin/sh

# get current wallpaper set by feh
wallpaper=$(grep feh < "$HOME/.fehbg" | awk '{ print $4 }' | tr -d \') 

# suspend notification daemon
pkill -u "$USER" -USR1 dunst

# turn screen off
sleep 2 && xset dpms force off &

pgrep -x i3lock || \
	i3lock \
		--nofork \
		--force-clock \
		--datestr="%A %B %e" \
		--line-uses-inside \
		--image="$wallpaper" \
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
		--noinputtext=""

# resume notification daemon
pkill -u "$USER" -USR2 dunst

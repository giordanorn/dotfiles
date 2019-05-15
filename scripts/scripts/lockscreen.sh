#!/usr/bin/sh

# get a random file
#WALLPAPER=$(find /usr/local/share/backgrounds | shuf | head -n1) 
WALLPAPER=/usr/local/share/backgrounds/01-bLxcjh3.png

pgrep -x i3lock || i3lock --clock --datestr="%A %B %e" --line-uses-inside --image=$WALLPAPER

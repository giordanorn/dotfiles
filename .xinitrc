#!/usr/bin/env bash

# set keyboard layout
setxkbmap -model thinkpad60 -layout br -variant abnt2

# run i3 if on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
	exec i3
fi

#!/bin/sh

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

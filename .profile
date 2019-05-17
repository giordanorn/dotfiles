#!/bin/sh

export EDITOR="vim"
export BROWSER="firefox"
export READER="evince"
export TERMINAL="st"

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

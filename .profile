#!/bin/sh

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export READER="evince"
export TERMINAL="st"
export SCRIPTS="$HOME/scripts"

if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

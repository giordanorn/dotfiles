#!/bin/sh

if [ $(echo -e "No\nYes" | dmenu -i -p "$@") == "Yes" ]; then
	exit 0;
else
	exit 1;
fi

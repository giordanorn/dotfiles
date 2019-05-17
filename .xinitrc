#!/usr/bin/env bash

# set keyboard layout
setxkbmap -model thinkpad60 -layout br -variant abnt2

# run i3 as default window manager
exec i3

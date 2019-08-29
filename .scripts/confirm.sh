#!/bin/sh

test "$(printf "No\nYes" | dmenu -i -p "$@")" == "Yes"

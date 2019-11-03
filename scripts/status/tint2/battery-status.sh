#!/bin/sh

icon=$(sh ../battery-icon.sh)
percent=$(sh ../battery-percent.sh)
remaining=$(sh ../battery-remaining.sh)

echo "$icon Battery"
echo "$percent% $remaining"

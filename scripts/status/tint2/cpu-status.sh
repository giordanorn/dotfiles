#!/bin/sh

temp=$(sh ../cpu-temperature.sh)
speed=$(sh ../cpu-speed.sh)
usage=$(perl ../cpu-usage.pl)

echo " CPU"
echo "$usage%  ${speed}GHz  $temp°C"

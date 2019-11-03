#!/bin/sh

# status percent number (less equal than)
percent_crit=15
percent_low=35
percent_avg=55
percent_good=75

# glyphs for label (FontAwesome)
bat_crit=""
bat_low=""
bat_avg=""
bat_good=""
bat_full=""
bat_plugged=""

# main command (acpi)
ac_info=$(acpi --ac-adapter)
bat_info=$(acpi --battery)
plugged="$(echo "$ac_info" | cut -c12-)"

# if there is no battery
if [ "$bat_info" = "" ]; then
    if [ "$plugged" = "on-line" ]; then
        label="$bat_plugged"
    fi
else
    percent="$(echo "$bat_info" | cut -d " " -f4 | tr -d ,%)"
    if [ "$plugged" = "on-line" ]; then
        label=$bat_plugged
    else
        # set battery label and color according to percent level, if has a battery
        if [ "$percent" -le "$percent_crit" ]; then
            label=$bat_crit
        elif [ "$percent" -le "$percent_low" ]; then
            label=$bat_low
        elif [ "$percent" -le "$percent_avg" ]; then
            label=$bat_avg
        elif [ "$percent" -le "$percent_good" ]; then
            label=$bat_good
        else
            label=$bat_full
        fi
    fi
fi

echo "$label"

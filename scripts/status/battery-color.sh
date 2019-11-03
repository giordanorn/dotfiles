#!/bin/sh

# status percent number (less equal than)
percent_crit=15
percent_low=35
percent_avg=55
percent_good=75

# colors
color_crit="#ff0000"
color_low="#ffa500"
color_avg="#ffff00"
color_good="#eeeeee"
color_full="#00ff00"

# main command (acpi)
ac_info=$(acpi --ac-adapter)
bat_info=$(acpi --battery)
plugged="$(echo "$ac_info" | cut -c12-)"

# if there is no battery
if [ "$bat_info" = "" ]; then
    if [ "$plugged" = "on-line" ]; then
        color="$color_good"
    fi
else
    percent="$(echo "$bat_info" | cut -d " " -f4 | tr -d ,%)"
    if [ "$plugged" = "on-line" ]; then
        color=$color_good
        if [ "$percent" -ge 99 ]; then
            color=$color_full
        fi
    else
        # set battery label and color according to percent level, if has a battery
        if [ "$percent" -le "$percent_crit" ]; then
            color=$color_crit
        elif [ "$percent" -le "$percent_low" ]; then
            color=$color_low
        elif [ "$percent" -le "$percent_avg" ]; then
            color=$color_avg
        elif [ "$percent" -le "$percent_good" ]; then
            color=$color_good
        else
            color=$color_good
        fi
    fi
fi

echo "$color"

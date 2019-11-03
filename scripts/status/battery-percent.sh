#!/bin/sh

# main command (acpi)
bat_info=$(acpi --battery)

# if there is no battery
if [ "$bat_info" = "" ]; then
    percent="no battery"
else
    percent="$(echo "$bat_info" | cut -d " " -f4 | tr -d ,%)"
fi

echo "$percent"

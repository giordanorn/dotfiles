#!/bin/sh

# main command (acpi)
bat_info=$(acpi --battery)

# format estimated time for fully charging or discharging
estimated_time="$(echo "$bat_info" | cut -d " " -f5 | cut -c1-5 | tr -d a-zA-Z)"
if [ -n "$estimated_time" ]; then
    _hour=$(echo "$estimated_time" | cut -c1-2)
    _minutes=$(echo "$estimated_time" | cut -c4-5)
    if [ "$_hour" -eq 0 ]; then
        _hour=""
        _minutes="${_minutes}m"
    else
        _hour="${_hour}h"
        _minutes="${_minutes}"
    fi
    estimated="($_hour$_minutes)"
fi

echo "$estimated"

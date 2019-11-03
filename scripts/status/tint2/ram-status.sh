#!/bin/sh

ram_free=$(
    free -h | \
    awk '/^Mem/ { print $7 }' | \
    tr -d 'i'
)
ram_usage=$(
    free -h | \
    awk '/^Mem/ { print $3 }' | \
    tr -d 'i'
)

echo " RAM"
echo "$ram_usage / $ram_free"

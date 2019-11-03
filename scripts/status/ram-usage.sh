#!/bin/sh

free -m | \
    awk '/^Mem:/ { print "scale=1;" $3 " / 1000" }' | \
    bc | \
    sed 's/^\./0./'

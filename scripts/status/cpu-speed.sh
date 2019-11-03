#!/bin/sh

# cat /proc/cpuinfo | awk '/^cpu MHz/ { print (int($4 / 100) / 10) }'

lscpu | awk '/^CPU MHz/ { print (int($3 / 100) / 10) }'

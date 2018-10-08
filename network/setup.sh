#!/usr/bin/env bash


# copy the configuration file to its folder
# cp ./wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf --verbose --backup

# kill all instances of wpa_supplicant for not having conflicts
killall wpa_supplicant

# setup the configuration file to wlp2s0 interface
wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf

# run wpa_cli for estabilish connection with your network

# (if not estabilished an ip address run dhclient)
dhclient wlp2s0

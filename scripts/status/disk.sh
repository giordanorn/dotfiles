#!/bin/sh

dir="${1:-$HOME}"

df -hBG "$dir" | awk '/\// { print $4 }' | tr -d G

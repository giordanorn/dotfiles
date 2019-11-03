#!/bin/sh

acpi -t | \
    grep -E -o '[0-9]*\.' | \
    tr -d . | \
    head -n1

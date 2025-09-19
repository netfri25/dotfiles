#!/bin/bash

if [ "$#" -ne 1]; then
    echo "Usage: $0 <from|to>"
    exit 1
fi

# keep a copy of the clipboard
prev=$(wl-paste -n)

wl-paste -np | sitelen-ucsur "$1" | wl-copy -n

wtype -M ctrl -k v

# wait for the paste to register
sleep 0.1s

# restore clipboard
wl-copy -n "$prev"

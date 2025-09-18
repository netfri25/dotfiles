#!/bin/bash

# keep a copy of the clipboard
prev=$(wl-paste -n)

wl-paste -np | sitelen-ucsur | wl-copy -n

wtype -M ctrl -k v

# wait for the paste to register
sleep 0.1s

# restore clipboard
wl-copy -n "$prev"

#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 <from|to>"
    exit 1
fi

# using the primary clipboard (-p) to get the currently selected text
# timeout to prevent hanging on non-supported applications
wl-paste -np | sitelen-ucsur "$1" | timeout 3s waytyper

#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 <from|to>"
    exit 1
fi

wl-paste -np | sitelen-ucsur "$1" | timeout 3s waytyper

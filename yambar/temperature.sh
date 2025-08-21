#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <interval_ms>" >&2
    exit 1
fi

interval_ms=$1
interval_sec=$(( interval_ms / 1000 ))
interval_frac=$(( interval_ms % 1000 ))

while true; do
    temp=$(< /sys/class/thermal/thermal_zone0/temp)
    printf "temperature|float|%.*s\n\n" 2 "$temp"
    sleep "$interval_sec.$interval_ms"
done

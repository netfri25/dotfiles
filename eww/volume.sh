#!/bin/bash

COOLDOWN_MS=25
STATE_FILE="/tmp/eww-volume-scroll"

INPUT_LIMIT=150
OUTPUT_LIMIT=100
limit=0
sink=""
name=""

debounce() {
    now=$(date +%s%3N) # milliseconds
    if [[ -f "$STATE_FILE" ]]; then
        last=$(cat "$STATE_FILE")
        delta=$((now - last))
        if ((delta < COOLDOWN_MS)); then
            exit 0
        fi
    fi

    echo "$now" > "$STATE_FILE"
}

get_volume() {
    local line
    read -r line < <(pactl get-"$name"-volume "$sink")
    local percent="${line#* / }"
    percent="${percent%%\%*}"
    percent="${percent#"${percent%%[![:space:]]*}"}"
    echo "$percent"
}

is_mute() {
    pactl get-"$name"-mute "$sink" | grep -q "yes"
}

listen() {
    pactl subscribe | grep --line-buffered "$name" | while read -r line; do
        get_volume
    done
}

usage() {
    echo "Usage: $0 <input|output> <up|down|mute|listen>" >&2
}

case "$1" in
    input)
        sink="@DEFAULT_SOURCE@"
        name="source"
        limit="$INPUT_LIMIT"
        ;;
    output)
        sink="@DEFAULT_SINK@"
        name="sink"
        limit="$OUTPUT_LIMIT"
        ;;
    *)
        usage
        exit 1
        ;;
esac

case "$2" in
    up)
        if is_mute; then
            exit 0
        fi
        volume=$(get_volume)

        # NOTE: won't really work with steps that are more than 1%
        if [[ "$volume" -ge "$limit" ]]; then
            pactl set-"$name"-volume "$sink" "$limit%"
        else
            pactl set-"$name"-volume "$sink" +1%
        fi
        ;;
    down)
        if is_mute; then
            exit 0
        fi
        volume=$(get_volume)

        pactl set-"$name"-volume "$sink" -1%
        ;;
    mute)
        pactl set-"$name"-mute "$sink" toggle
        ;;
    listen)
        get_volume
        listen
        ;;
    *)
        usage
        exit 1
        ;;
esac

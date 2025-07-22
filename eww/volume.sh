#!/bin/bash

INPUT_LIMIT=150
OUTPUT_LIMIT=100
limit=0
sink=""
name=""

get_volume() {
    output=$(wpctl get-volume "$sink" | tr -d '.')

    # remove prefix
    prefix="Volume: "
    output="${output#$prefix}"

    # remove all leading zeros
    output=$(echo $output | sed 's/^0*\([0-9]\)/\1/')

    if echo "$output" | grep -q "MUTED"; then
        echo "muted"
    else
        echo "$output"
    fi
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
        sink="@DEFAULT_AUDIO_SOURCE@"
        name="source"
        limit="$INPUT_LIMIT"
        ;;
    output)
        sink="@DEFAULT_AUDIO_SINK@"
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
        volume=$(get_volume)
        if [[ "$volume" == "muted" ]]; then
            exit 0
        fi

        # NOTE: won't really work with steps that are more than 1%
        if [[ "$volume" -ge "$limit" ]]; then
            wpctl set-volume "$sink" "$limit%"
        else
            wpctl set-volume "$sink" 1%+
        fi
        ;;
    down)
        volume=$(get_volume)
        if [[ "$volume" == "muted" ]]; then
            exit 0
        fi

        wpctl set-volume "$sink" 1%-
        ;;
    mute)
        wpctl set-mute "$sink" toggle
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


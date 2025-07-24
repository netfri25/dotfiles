#!/bin/bash

BATTERY="/sys/class/power_supply/BAT1"

battery_watts() {
    current_micro_amps=$(<"$BATTERY/current_now")
    voltage_micro_volts=$(<"$BATTERY/voltage_now")

    input="scale=3; $current_micro_amps * $voltage_micro_volts / 1000000000000"
    watts=$(echo "$input" | bc)
    echo $watts
}

battery_time() {
    charge_now=$(<"$BATTERY/charge_now")
    current_now=$(<"$BATTERY/current_now")

    if (( current_now == 0 )); then
        echo "0"
        return
    fi

    charge_full=$(<"$BATTERY/charge_full")

    if (( current_now < 0 )); then
        # discharging
        current_now=$(( -current_now ))
        time_minutes=$(( charge_now * 60 / current_now ))
    else
        # charging
        charge_remaining=$(( charge_full - charge_now ))
        time_minutes=$(( charge_remaining * 60 / current_now ))
    fi

    hours=$(( $time_minutes / 60 ))
    minutes=$(( $time_minutes % 60 ))

    if (( hours > 0 )); then
        echo -n "${hours}h "
    fi

    echo "${minutes}m"
}

usage() {
    echo "Usage: $0 <watts|time>" >&2
}

case "$1" in
    watts)
        battery_watts
        ;;
    time)
        battery_time
        ;;
    *)
        usage
        exit 1
        ;;
esac

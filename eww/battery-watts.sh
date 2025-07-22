#!/bin/bash

battery="/sys/class/power_supply/BAT1"
current_micro_amps=$(cat "$battery/current_now")
voltage_micro_volts=$(cat "$battery/voltage_now")

input="scale=3; $current_micro_amps * $voltage_micro_volts / 1000000000000"
watts=$(echo "$input" | bc)
echo $watts

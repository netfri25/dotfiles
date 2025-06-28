#!/bin/bash

total=$(hyprctl monitors | awk '/Monitor/ {count++} END {print count}')

if [ "$total" -eq 2 ]
then
   hyprctl keyword monitor "eDP-1,disable"
   hyprctl hyprsunset identity
else
   hyprctl keyword monitor "eDP-1,preferred,auto,1"
   hyprctl hyprsunset temperature 5600
fi

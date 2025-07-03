#!/bin/bash

total=$(wlr-randr | awk '/ Enabled: yes/ {count++} END {print count}')

if [ "$total" -eq 2 ]
then
   wlr-randr --output eDP-1 --off
else
   wlr-randr --output eDP-1 --on
fi

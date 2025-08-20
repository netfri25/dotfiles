#!/bin/bash

# freeze
hyprpicker -r -z &
sleep .01

slurp | grim -g - - | $(dirname "$0")/save.sh

# unfreeze
pkill hyprpicker

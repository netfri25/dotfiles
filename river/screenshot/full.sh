#!/bin/bash

# freeze
hyprpicker -r -z &
sleep .1

slurp -o | grim -g - - | $(dirname "$0")/save.sh

# unfreeze
pkill hyprpicker

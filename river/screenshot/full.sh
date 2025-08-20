#!/bin/bash

# freeze
hyprpicker -r -z &
sleep .1


# unfreeze
pkill hyprpicker

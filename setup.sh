#!/usr/bin/bash

set -xe

CONFIG_PATH="$HOME/.config"

# NOTE: not using ls on purpose, in case there will be some other configs that require different locations
CONFIGS=(
    foot
    dwm
    fish
    neovide
    nvim
    river
    fuzzel
    waybar
    eww
)

for item in "${CONFIGS[@]}"; do
    ln -s "$PWD/$item" $CONFIG_PATH
done

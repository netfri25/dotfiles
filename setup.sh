#!/usr/bin/bash

set -xe

CONFIG_PATH="~/.config"

# NOTE: not using ls on purpose, in case there will be some other configs that require different locations
CONFIGS=(
    alacritty
    dwm
    fish
    neovide
    nvim
    river
    fuzzel
    waybar
)

for item in "${CONFIGS[@]}"; do
    ln -s "$PWD/$item" $CONFIG_PATH
done

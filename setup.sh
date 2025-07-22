#!/usr/bin/bash

set -xe

CONFIG_PATH="$HOME/.config"

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
    eww
)

for item in "${CONFIGS[@]}"; do
    ln -s "$PWD/$item" $CONFIG_PATH
done

# make the nvimpager have the same state as nvim
NVIM_DIRS=(
    "$HOME/.config"
    "$HOME/.local/state"
    "$HOME/.local/share"
)

for dir in "${NVIM_DIRS[@]}"; do
    ln -s "$dir/nvim" "$dir/nvimpager"
done

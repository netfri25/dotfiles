#!/usr/bin/bash

set -xe

CONFIG_PATH="$HOME/.config"
mkdir -p $CONFIG_PATH

# NOTE: not using ls on purpose, in case there will be some other configs that require different locations
CONFIGS=(
    foot
    fish
    neovide
    nvim
    river
    fuzzel
    mako
)

for item in "${CONFIGS[@]}"; do
    ln -s "$PWD/$item" $CONFIG_PATH
done

# fonts
FONTS_PATH="$HOME/.local/share/fonts"
mkdir -p "$FONTS_PATH"

cp -r "$PWD/fonts/." "$FONTS_PATH"

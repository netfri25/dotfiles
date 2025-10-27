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

# create backup directory
BACKUP="/tmp/backup"
[ -e "$BACKUP" ] && rm -vrf "$BACKUP"
mkdir -p "$BACKUP"

# move everything (if exist) to the backup directory
mv -t "$BACKUP" "${CONFIGS[@]/#/$CONFIG_PATH/}" || true 2>/dev/null

# create symbolic links for the configs from dotfiles to config directory
ln -st "$CONFIG_PATH" "${CONFIGS[@]/#/$PWD/}"

# fonts
FONTS_PATH="$HOME/.local/share/fonts"
mkdir -p "$(dirname "$FONTS_PATH")"

[ -e "$FONTS_PATH" ] && mv -t "$BACKUP" "$FONTS_PATH"

ln -sT "$PWD/fonts" "$FONTS_PATH"

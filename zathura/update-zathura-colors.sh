#!/bin/bash

# Source the pywal colors
source "${HOME}/.cache/wal/colors.sh"

# Define the path to Zathura's configuration file
CONFIG_FILE="${HOME}/.config/zathura/zathurarc"

# Backup the existing configuration file
cp "$CONFIG_FILE" "$CONFIG_FILE.bak"

# Remove existing color settings from the config file
grep -v '^set default-fg' "$CONFIG_FILE.bak" | \
grep -v '^set default-bg' | \
grep -v '^set statusbar-bg' | \
grep -v '^set statusbar-fg' | \
grep -v '^set inputbar-bg' | \
grep -v '^set inputbar-fg' | \
grep -v '^set notification-bg' | \
grep -v '^set notification-fg' | \
grep -v '^set recolor-lightcolor' | \
grep -v '^set recolor-darkcolor' > "$CONFIG_FILE"

# Append new color settings to the config file
cat <<EOL >> "$CONFIG_FILE"
set default-bg $background
set default-fg $foreground
set statusbar-bg $background
set statusbar-fg $color7
set inputbar-bg $background
set inputbar-fg $foreground
set notification-bg $background
set notification-fg $foreground
set recolor-lightcolor $background
set recolor-darkcolor $foreground
EOL

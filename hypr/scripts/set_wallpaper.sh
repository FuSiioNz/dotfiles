#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR=~/Pictures/Wallpapers

# Get the list of image files in the directory
IMAGES=($(ls "$WALLPAPER_DIR"))

# Use Wofi to select an image
SELECTED=$(printf "%s\n" "${IMAGES[@]}" | wofi --dmenu --prompt="Select a wallpaper")

# If an image is selected, set it as wallpaper using swww
if [[ -n "$SELECTED" ]]; then
  swww img -fill "$WALLPAPER_DIR/$SELECTED"
  wal -i "$WALLPAPER_DIR/$SELECTED" # Generate color scheme with pywal
  pkill waybar
  waybar
  ~/.config/mako/update-theme.sh
fi

#!/bin/bash

# Define the screenshot paths
screenshot_path="$HOME/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png"
upscaled_path="$HOME/Pictures/Screenshots/screenshot_upscaled_$(date +%Y%m%d_%H%M%S).png"

# Take a screenshot with slurp if using the -g option, else full screen
if [[ $1 == "region" ]]; then
  grim -g "$(slurp)" - | tee "$screenshot_path" | wl-copy
else
  grim - | tee "$screenshot_path" | wl-copy
fi

# Upscale the image
convert "$screenshot_path" -resize 300% "$upscaled_path"

# Notify the user
notify-send "Screenshot" "Copied to clipboard and saved to Pictures"

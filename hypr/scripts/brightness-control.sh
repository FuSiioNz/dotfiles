#!/bin/bash

# Function to get brightness status
get_brightness_info() {
    brightness=$(brightnessctl g)
    max_brightness=$(brightnessctl m)
    brightness_percent=$((brightness * 100 / max_brightness))
}

# Set the specific icon path
ICON_PATH="/usr/share/icons/Papirus/64x64/apps/preferences-system-brightness-lock.svg"

case $1 in
    down)
        brightnessctl set 5%-
        ;;
    up)
        brightnessctl set +5%
        ;;
    *)
        echo "Usage: $0 {down|up}"
        exit 1
        ;;
esac

# Get updated brightness info
get_brightness_info

# Send notification using Mako
notify-send "Brightness ${brightness_percent}%" \
    -i "$ICON_PATH" \
    -h int:value:$brightness_percent \
    -t 1200 \
    -e \
    -u low \
    -h string:synchronous:brightness-$brightness_percent \
    -h string:x-canonical-private-synchronous:brightness

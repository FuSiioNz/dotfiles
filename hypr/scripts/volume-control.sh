#!/bin/bash
# Function to get volume and mute status
get_volume_info() {
    volume=$(amixer -D pulse get Master | grep -oP '\d+%' | head -n1 | tr -d '%')
    mute_status=$(amixer -D pulse get Master | grep -oP '\[on\]|\[off\]' | head -n1)
}
# Function to determine the appropriate Unicode icon
get_volume_icon() {
    if [ "$mute_status" = "[off]" ]; then
        echo "🔇"
    elif [ $volume -eq 0 ]; then
        echo "🔈"
    elif [ $volume -lt 33 ]; then
        echo "🔉"
    else
        echo "🔊"
    fi
}
case $1 in
    down)
        amixer -q -D pulse sset Master 5%- unmute
        ;;
    up)
        amixer -q -D pulse sset Master 5%+ unmute
        ;;
    mute)
        amixer -q -D pulse sset Master toggle
        ;;
    *)
        echo "Usage: $0 {down|up|mute}"
        exit 1
        ;;
esac
# Get updated volume info
get_volume_info
# Get the appropriate icon
icon=$(get_volume_icon)
# Send notification using Mako
notify-send "$icon Volume: $volume%" \
    -h int:value:$volume \
    -t 1200 \
    -e \
    -u low \
    -h string:synchronous:volume-$volume \
    -h string:x-canonical-private-synchronous:volume
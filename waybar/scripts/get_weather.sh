#!/usr/bin/env bash

url="https://wttr.in/"location"?format=%c+%t"

for i in {1..5}; do
    # Fetch weather in "City: Condition Temp" format
    text=$(curl -s -H 'Cache-Control: no-cache' "$url")
    if [[ $? -eq 0 ]]; then
        text=$(echo "$text" | sed -E 's/\s+/ /g')
        
        tooltip=$(curl -s -H 'Cache-Control: no-cache' "https://wttr.in/"location"?format=4")
        if [[ $? -eq 0 ]]; then
            tooltip=$(echo "$tooltip" | sed -E 's/\s+/ /g')
            # Output in JSON format for Waybar
            echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
            exit
        fi
    fi
    sleep 2
done

# If all attempts fail
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"

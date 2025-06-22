#!/bin/bash

# Configuration
MAX_LENGTH=10
ELLIPSIS="..."
FORMAT='{{ artist }} - {{ title }}'

# Function to truncate text intelligently
truncate_text() {
    local text="$1"
    local max_len="$2"
    
    if [ ${#text} -le $max_len ]; then
        echo "$text"
        return
    fi
    
    # Try to truncate at word boundary
    local truncated="${text:0:$((max_len - ${#ELLIPSIS}))}"
    local last_space=$(echo "$truncated" | grep -o '.* ' | tail -c +1)
    
    if [ -n "$last_space" ] && [ ${#last_space} -gt $((max_len / 2)) ]; then
        echo "${last_space% }$ELLIPSIS"
    else
        echo "$truncated$ELLIPSIS"
    fi
}

# Check if playerctl is available
if ! command -v playerctl &> /dev/null; then
    echo "no playerctl"
    exit 1
fi

# Get player status
if ! playerctl status &> /dev/null; then
    echo "no player"
    exit 0
fi

# Get metadata with error handling
info=$(playerctl metadata --format "$FORMAT" 2>/dev/null)

# Handle empty or missing metadata
if [ -z "$info" ] || [ "$info" = " - " ]; then
    # Try to get just the title if artist-title format fails
    title=$(playerctl metadata title 2>/dev/null)
    if [ -n "$title" ]; then
        info="$title"
    else
        echo "playing"
        exit 0
    fi
fi

# Get player status for icon
status=$(playerctl status 2>/dev/null)
case "$status" in
    "Playing") icon="▶ " ;;
    "Paused")  icon="⏸ " ;;
    *)         icon="" ;;
esac

# Truncate and display
result=$(truncate_text "$info" $MAX_LENGTH)
echo "$icon$result"


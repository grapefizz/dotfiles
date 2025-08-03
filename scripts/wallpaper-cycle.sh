#!/bin/bash

# Wallpaper cycling script
WALLPAPER_DIR="/Users/Ari/dev/dots/config/wallpapers"

# Get all wallpaper files and put them in an array
wallpapers=()
for file in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,heic}; do
    [ -f "$file" ] && wallpapers+=("$file")
done

# Check if we found any wallpapers
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "No wallpaper files found in $WALLPAPER_DIR"
    exit 1
fi

# Get random wallpaper
RANDOM_WALLPAPER=${wallpapers[$RANDOM % ${#wallpapers[@]}]}

# Set wallpaper using osascript
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$RANDOM_WALLPAPER\""

echo "Wallpaper changed to: $RANDOM_WALLPAPER"

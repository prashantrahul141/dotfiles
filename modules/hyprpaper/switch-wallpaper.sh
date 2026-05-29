#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/curr"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# find index of current file, also count of all files.
CURRENT_INDEX=0
TOTAL_WALLS=0
for file in "$WALLPAPER_DIR"/*; do
    ((TOTAL_WALLS+=1))
    if [[ "$file" == "$CURRENT_WALL" ]]; then
        CURRENT_INDEX=$TOTAL_WALLS
    fi
done

# select next wallpaper and set
SET_WALL_TO_INDEX=$(($((CURRENT_INDEX + 1)) % TOTAL_WALLS))
COUNT=0
for file in "$WALLPAPER_DIR"/*; do
    if [[ "$COUNT" == "$SET_WALL_TO_INDEX" ]]; then
        hyprctl hyprpaper reload ", $file"
        break
    fi

    ((COUNT+=1))
done

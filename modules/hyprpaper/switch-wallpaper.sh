#!/usr/bin/env bash

set -e

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/curr"
ACTIVE="$HOME/Pictures/Wallpapers/active"

# find index of current file, also count of all files.
CURR_WALL=$(readlink -f  "$ACTIVE")

# count total walls, get current one's id
TOTAL_WALLS=0
CURRENT_INDEX=0
for file in "$WALLPAPER_DIR"/*; do
    if [[ "$file" == "$CURR_WALL" ]]; then
        CURRENT_INDEX=$TOTAL_WALLS
    fi
    ((TOTAL_WALLS+=1))
done

# select next wallpaper and set
SET_WALL_TO_INDEX=$(($((CURRENT_INDEX + 1)) % TOTAL_WALLS))
COUNT=0
for file in "$WALLPAPER_DIR"/*; do
    if [[ "$COUNT" == "$SET_WALL_TO_INDEX" ]]; then
        rm -f "$ACTIVE"
        ln -s "$file" "$ACTIVE"
        hyprctl hyprpaper wallpaper ",$ACTIVE"
        break
    fi
    ((COUNT+=1))
done

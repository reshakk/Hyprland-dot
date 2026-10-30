#!/usr/bin/env bash

rofi_source="$HOME/.cache/wal/colors-rofi-dark.rasi"
rofi_output="$HOME/.config/rofi/assets/colors.rasi"

matugen --prefer darkness image "$HOME/.current_wallpaper"

"$HOME/.config/hypr/scripts/refresh.sh"

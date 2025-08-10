#!/usr/bin/env bash

rofi_source="$HOME/.cache/wal/colors-rofi-dark.rasi"
rofi_output="$HOME/.config/rofi/assets/colors.rasi"

wal -c
wal -i "$HOME/.current_wallpaper"

css_variable=(
  "active-background: *"
  "urgent-background: *"
  "selected-active-background: *"
  "selected-normal-background: *"
  "selected-urgent-background: *"
  "background: *"
  "foreground: *"
)


for rpg in "${css_variable[@]}"; do
  source_str=$(grep  "^[[:space:]]*$rpg"  "$rofi_source" | head -n1)
  output_str=$(grep  "^[[:space:]]*$rpg"  "$rofi_output" | head -n1)
  sed -i "s|$output_str|$source_str|g" "$rofi_output"
done

cp "$HOME/.cache/wal/colors-waybar.css" "$HOME/.config/waybar/colors.css"

cp "$HOME/.cache/wal/colors-kitty.conf" "$HOME/.config/kitty/colors.conf"

cp "$HOME/.cache/wal/hyprland" "$HOME/.config/hypr/configs/colors.conf"

"$HOME/.config/hypr/scripts/refresh.sh"

#!/bin/bash

HYPR_CONF="$HOME/.config/hypr/configs/keybinds.conf"
ROFI_CONF="$HOME/.config/rofi/configs/keybinds.rasi"


format=$(printf "\"\(.address) | \(.title) >> \(.class)\"")
windows="$(hyprctl clients -j | jq -r ".[] | $format")"
window=$(echo "$windows" | rofi -dmenu -matching normal -i -p "Hyprland windows switchers:" -theme ${ROFI_CONF})
if [ "$window" = "" ]; then
	exit 0
fi

address=$(echo $window | cut -d "|" -f 1)
echo $address
if [ "$address" = "" ]; then
	exit 0
else
	hyprctl dispatch focuswindow address:$address
fi

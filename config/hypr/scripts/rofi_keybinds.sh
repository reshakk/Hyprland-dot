#!/bin/bash

HYPR_DIR=("$HOME/.config/hypr/configs")
HYPR_CONF=("$HYPR_DIR/keyb-hypr.conf" "$HYPR_DIR/keyb-app.conf")
ROFI_CONF="$HOME/.config/rofi/configs/keybinds.rasi"



all_text=""

for line in "${HYPR_CONF[@]}"; do
	# Extract the keybindings from hyprland.conf
	mapfile -t BINDINGS < <(grep '^bind[ =]' "$line" | \
    	sed 's/^[[:space:]]*bind[ =]\+//; s/[[:space:]]\+/,/g; s/,[[:space:]]*,/,/g' | \
    	awk -F',' '{cmd=""; for(i=3;i<=NF;i++) cmd=cmd $i " "; print "<b>"$1 " + " $2 "</b>  <i>" cmd "</i>"}')
	all_text+=$(printf "%s\n" "${BINDINGS[@]}")
done

echo "$all_text"

# Show menu and get selection
CHOICE=$(printf '%s\n' "${all_text[@]}" | rofi -dmenu -i -markup-rows -p "Hyprland Keybinds:" -theme ${ROFI_CONF})

# Exit if no choice made
[[ -z "$CHOICE" ]] && exit 0

# Extract command (everything after the <i> tag)
CMD=$(echo "$CHOICE" | sed 's/.*<i>\(.*\)<\/i>.*/\1/' | xargs)

# Execute based on command type
if [[ "$CMD" =~ ^exec[[:space:]] ]]; then
    # Remove 'exec' and execute
    EXEC_CMD=${CMD#exec }
    eval "$EXEC_CMD"
else
    # Use hyprctl for non-exec commands
    hyprctl dispatch "$CMD"
fi


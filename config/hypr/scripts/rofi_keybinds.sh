#!/bin/bash

HYPR_DIR=("$HOME/.config/hypr/configs")
HYPR_CONF=("$HYPR_DIR/keybinds.conf")
ROFI_CONF="$HOME/.config/rofi/configs/keybinds.rasi"

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-theme ${ROFI_CONF}
}

# Ask for confirmation
confirm_keyb() {
	echo -e "vim\nhyprland" | confirm_cmd
}

keyb_hypr() {
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
}

chosen="$(confirm_keyb)"
if [[ "$chosen" == "vim" ]]; then
  break
elif [[ "$chosen" == "hyprland" ]]; then
  keyb_hypr
else
  exit 0
fi


#!/bin/bash
KEYB_DIR="$HOME/.local/keybinds"
CHOSE_CONF="$HOME/.config/rofi/configs/powermenu.rasi"
ROFI_CONF="$HOME/.config/rofi/configs/keybinds.rasi"

VIM_KEYB="$KEYB_DIR/nvim-keybinds.md"
HYPR_CONF="$HOME/.config/hypr/configs/keybinds.conf"
TMUX_KEYB="$KEYB_DIR/tmux-commands.md"

COLOR="#8DA350"

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 2;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-theme ${CHOSE_CONF}
}

run_rofi() {
	echo -e "vim\nhyprland\ntmux" | confirm_cmd
}

keyb_hypr() {
    all_text=""
    for line in "${HYPR_CONF[@]}"; do
      mainMod="$(grep '^$mainMod[ =]' "$line" | \
        sed 's/^[[:space:]]*$mainMod[ =]\+//' | \
          cut -d" " -f 1)"
      [[ "$mainMod" == "SUPER" ]] && mainMod="Windows" 
      #echo "$mainMod"
            mapfile -t BINDINGS < <(grep '^bind[ =]' "$line" | \
                sed 's/^[[:space:]]*bind[ =]\+//; s/[[:space:]]\+/,/g; s/,[[:space:]]*,/,/g' | \
          awk -F',' -v color="$COLOR" -v mod="$mainMod" '{cmd=""; for(i=3;i<=NF;i++) cmd=cmd $i " "; if ( $1 == "" ) print "<span color=\"" color "\"><b>" $1" "$2 " " $3 " </b></span>  <i>" cmd "</i>" ;else print "<span color=\"" color "\"><b>" mod " + " $2 " " $3 " </b></span>  <i>" cmd "</i>"}')
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

form_text() {
	local KEYB=$1
	for line in "${KEYB[@]}"; do
		  mapfile -t BINDINGS < <(cat "$line" | \
		    sed  "s/^[[:space:]]*//; /^[[:space:]]*$/d; 
			      s/^##[[:space:]]*\(.*\)$/<b>\1<\/b>/;" | \
				      awk -F' - ' -v color="$COLOR" '{ if (NF == 1) print $1; else  print "<span color=\"" color "\"><b>" $1"</b></span> → <b>"$2"</b>"}')
		  all_text+=$(printf "%s\n" "${BINDINGS[@]}") 
	done

}

keyb_vim() {
    all_text=""

    form_text "$VIM_KEYB"

    CHOICE=$(printf '%s\n' "${all_text[@]}" | rofi -dmenu -i -markup-rows -p "Vim Keybinds:" -theme ${ROFI_CONF})

}

keyb_tmux() {
    all_text=""

    form_text "$TMUX_KEYB"

    CHOICE=$(printf '%s\n' "${all_text[@]}" | rofi -dmenu -i -markup-rows -p "Tmux Keybinds:" -theme ${ROFI_CONF})

}

chosen="$(run_rofi)"
if [[ "$chosen" == "vim" ]]; then
    keyb_vim
elif [[ "$chosen" == "hyprland" ]]; then
    keyb_hypr
elif [[ "$chosen" == "tmux" ]]; then
    keyb_tmux
else
    exit 0
fi

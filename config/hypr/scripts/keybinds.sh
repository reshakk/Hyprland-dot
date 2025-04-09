#!/usr/bin/env bash

# Define hotkeys for different applications
VIM_HOTKEYS="Ctrl + N: New File\nCtrl + O: Open File\nCtrl + S: Save File"
HYPRLAND_HOTKEYS="Super + Q: Open Kitty
Super + W: Open gedit
Super + E: Open Thunar
Super + O: Open obsidian
Super + R: Open rofi

Super + C: Kill active window
Super + F: Fullscreen
Super + L: Hyprlock
Super + alt + M: Exit from session
Super + V: Active window is float
Super + Shift + V: All windows float
Super + J: Togglesplit
Super + G: Togglegroup
Alt + Tab: change active group

Super + N: Notifications
Super + PRINT: Screenshot
Super + P: Color-picker
Super + Escape: wlogout

Super + alt + R: Refresh waybar,swaync,wlogout,hypridle
Super + alt + V: Clipboard Manager
Super + H: All hotkeys
Super + alt + W: Wallpaper manager

Super + 1..10: Switch workspace
Super + scroll: Switch existing workspace
Super + Shift + 1..10: Move active window
Super + ctrl + 1..10: Move active window silently
Super + LMB/RMB: Move window or resize window
Super + left/right/up/down: Move focus on window
Super + S: Open magic workspace
Super + Shift + S: Move active window to special workspace"

# Combine hotkeys into a formatted string
DISPLAY_TEXT="Hyprland:\n$HYPRLAND_HOTKEYS"

# Display the hotkeys in a YAD window
yad --title "Hotkeys" --text "$DISPLAY_TEXT" --scroll --width 350 --height 400 --button="Close"

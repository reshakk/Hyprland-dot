#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting......."
    exit 1
fi

mkdir -p Copy-Logs

LOG="Copy-Logs/install-$(date +%d-%H%M%S)_dotfiles.log"

# update home folders
xdg-user-dirs-update 2>&1 | tee -a "$LOG" || true

set -e

if [ ! -d "$HOME/.config" ]; then
	echo "The ~/.config directory does not exist."
	exit 1
fi

if [ ! -d "config" ]; then
	echo "Config directory does not exist."
	exit 1
fi

get_backup_dirname() {
	local timestamp
	timestamp=$(date +"%m%d_%H%M")
	echo "back-up_${timestamp}"
}

printf "Copying dotfiles\n"

DIRS="
  gedit
  hypr
  kitty
  rofi
  swaync
  waybar
  wlogout
  gtk-3.0
"

for DIR2 in $DIRS; do
	DIRPATH=~/.config/"$DIR2"
	
	if [ -d "$DIRPATH" ]; then
		while true; do
			read -p "$DIR2 config found in ~/.config/ Do you want to replace $DIR2 config? (y/n): " DIR1_CHOICE
			case "$DIR1_CHOICE" in
				[Yy]* )
					BACKUP_DIR=$(get_backup_dirname)
					mv "$DIRPATH" "$DIRPATH-backup-$BACKUP_DIR" 2>&1 | tee -a "$LOG"
					if [ $? -eq 0 ]; then
						echo "Backed up $DIR2 to $DIRPATH-backup-$BACKUP_DIR." 2>&1 | tee -a "$LOG"
						
						cp -r config/"$DIR2" ~/.config/"$DIR2" 2>&1 | tee -a "$LOG"
						if [ $? -eq 0 ]; then
							echo "Replaced $DIR2 with new configuration." 2>&1 | tee -a "$LOG"
						else
							echo "Failed to copy $DIR2." 2>&1 | tee -a "$LOG"
							exit 1
						fi
					else
						echo "Failed to back up $DIR2." 2>&1 | tee -a "$LOG"
						exit 1
					fi
					break
					;;
				[Nn]* )
					echo "Skipping $DIR2." 2>&1 | tee -a "$LOG"
					break
					;;
				* )
					echo "Invalid choice. Please enter Y or N."
					;;
			esac
		done
	else
		cp -r config/"$DIR2" ~/.config/"$DIR2" 2>&1 | tee -a "$LOG"
		if [ $? -eq 0 ]; then
			echo "Copy completed for $DIR2." 2>&1 | tee -a "$LOG"
		else
			echo "Failed to copy $DIR2." 2>&1 | tee -a "$LOG"
			exit 1
		fi
	fi
done

mkdir -p ~/Pictures
cp -r ../wallpapers ~/Pictures/ && { echo "Some wallpapers are copied."; } || { echo "Failed to copy wallpapers."; } 2>&1 | tee -a "$LOG"
chmod +x ~/.config/hypr/scripts/* 2>&1 | tee -a "$LOG"


printf "\n%.0s" {1..4}
printf "GREAT! Hyprland-Dots is now Loaded & Ready !!!"
printf "\n%.0s" {1..1}
printf "HOWEVER I HIGHLY SUGGEST to logout and re-login or better reboot to avoid any issues\n\n"


hl.on("hyprland.start", function () 
	-- wallpaper stuff / More wallpaper options below
	hl.exec_cmd("swww-daemon")

	hl.exec_cmd("nextcloud &")

	hl.exec_cmd("hypridle & waybar & swaync")

	-- clipboard manager
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	hl.exec_cmd("~/.config/hypr/scripts/autostart.sh")
end)

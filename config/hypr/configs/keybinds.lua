local mainMod = "SUPER"
local scripts = "$HOME/.config/hypr/scripts"

-- Notifications
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

-- Rofi
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(
    "pkill rofi || rofi -show drun -theme ~/.config/rofi/main.rasi"
))

hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(scripts .. "/powermenu.sh"))
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd(scripts .. "/clipManager.sh"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd(scripts .. "/rofi_keybinds.sh"))
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd(scripts .. "/wallpaperSelect.sh"))

hl.bind("ALT + TAB", hl.dsp.exec_cmd(
    "pkill rofi || rofi -show window -theme ~/.config/rofi/configs/keybinds.rasi"
))

hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd(scripts .. "/refresh.sh"))

-- Applications
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("gedit"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("Thunar"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pavucontrol"))

-- Window management
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + ALT + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd(scripts .. "/gamemode.sh"))

-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Pin
hl.bind(mainMod .. " + P", hl.dsp.window.pin(), { description = "Window: Pin" })

-- Hyprpicker
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker | wl-copy"))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

-- Groups
--hl.bind(mainMod .. " + G", hl.dsp.togglegroup())

-- Volume
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true }
)

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true }
)

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true }
)

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces: keys 1-9 go to workspaces 1-9, key 0 goes to workspace 10
for i = 0, 9 do
    local workspace = (i == 0) and 10 or i
    local key = tostring(i)

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = workspace })
    )

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = workspace })
    )
end

-- Special workspace / scratchpad
hl.bind(mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.window.move({ workspace = "special:magic" })
)

-- Workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse window management
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

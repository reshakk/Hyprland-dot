-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-------------------
--      Steam    --
-------------------
hl.window_rule({
    center = true,
    float = true,
    match = { class = "^(steam)$" },
    size = { "monitor_w*0.86", "monitor_h*0.8" },
})

hl.window_rule({
    match = { class = "^(steam)$", title = "^(Friends List)$" },
    float = true,
    size = { "monitor_w*0.14", "monitor_h*0.5" },
    move = { "monitor_w*0.845", "monitor_h*0.48" },
})

hl.window_rule({ match = { title = ".*\\.exe" }, immediate = true })
hl.window_rule({ match = { class = "^(steam_app)" }, immediate = true })

hl.window_rule({
    match = { class = "^(steam_app_.*|.*[Ww]ine.*)$" },
    workspace = "3 silent",
})

hl.window_rule({
    match = { class = "^(steam|com\\.valvesoftware\\.Steam)$" },
    workspace = "4 silent",
})

hl.window_rule({
    match = { class = "discord" },
    workspace = "special:magic silent",
})

-------------------
-- File Explorer --
-------------------
hl.window_rule({ match = { title = "^(File Operation Progress)" }, float = true })

hl.window_rule({
    match = { title = "^(Save File)" },
    float = true,
    size = { 800, 600 },
})

for _, class in ipairs({
    "confirm",
    "dialog",
    "download",
    "extract",
    "file-roller",
}) do
    hl.window_rule({ match = { class = class }, float = true })
end

hl.window_rule({ match = { title = "Open File" }, float = true })
hl.window_rule({ match = { class = "Thunar" }, opacity = "0.9 0.9" })

-------------------
--     Volume    --
-------------------
hl.window_rule({
    match = { title = "^(Volume Control)$" },
    float = true,
    size = { 800, 600 },
    move = { 75, "monitor_h*0.44" },
    opacity = "0.9 0.75",
})

hl.window_rule({ match = { class = "pavucontrol-qt" }, float = true })

-------------------
-- Mission Center --
-------------------
hl.window_rule({
    match = { title = "^(Mission Center)$" },
    float = true,
    size = { 800, 600 },
    move = { 75, "monitor_h*0.44" },
    opacity = "0.9 0.75",
})

-------------------
--    Nm-conn    --
-------------------
hl.window_rule({
    match = { class = "^(nm-connection-editor)$" },
    float = true,
    size = { "monitor_w*0.45", "monitor_h*0.45" },
    center = true,
    opacity = "0.9 0.70",
})

-------------------
--   Nextcloud   --
-------------------
hl.window_rule({
    match = { title = "^(Nextcloud)$" },
    float = true,
    move = { "monitor_w*0.78", "monitor_h*0.05" },
    size = { "monitor_w*0.20", "monitor_h*0.50" },
    stay_focused = true,
})

hl.window_rule({
    match = { title = "^(Nextcloud Settings)$" },
    float = true,
    move = { "monitor_w*0.42", "monitor_h*0.12" },
    size = { "monitor_w*0.35", "monitor_h*0.35" },
})

-------------------
--    Browser    --
-------------------
local pipTitle = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"

hl.window_rule({
    match = { title = pipTitle },
    float = true,
    keep_aspect_ratio = true,
    move = { "monitor_w*0.73", "monitor_h*0.72" },
    size = { "monitor_w*0.25", "monitor_h*0.25" },
    pin = true,
})

hl.window_rule({
    match = { title = "^(librewolf — Sharing Indicator)$" },
    move = { 0, 0 },
})

hl.window_rule({ match = { class = "librewolf" }, idle_inhibit = "fullscreen" })
hl.window_rule({ match = { class = "firefox" }, idle_inhibit = "fullscreen" })

-------------------
--     Other     --
-------------------
--for _, class in ipairs({
--    "Shotwell",
--    "qalculate-gtk",
--    "notification",
--    "error",
--    "splash",
--    "confirmreset",
--    "Lxappearance",
--    "ncmpcpp",
--    "Telegram",
--    "org.qbittorrent.qBittorrent",
--}) do
--    hl.window_rule({ match = { title = class }, float = true })
--end

hl.window_rule({ match = { title = "branchdialog" }, float = true })
hl.window_rule({ match = { title = "^(.*)(gedit)$" }, float = true })
hl.window_rule({ match = { title = "^(.*)(Shotwell)$" }, float = true })
hl.window_rule({ match = { title = "^(Transmission)$" }, float = true })

hl.window_rule({
    match = { title = "Telegram"},
    float = true,
    move = { "monitor_w*0.62", "monitor_h*0.12" },
    size = { "monitor_w*0.35", "monitor_h*0.55" },
})

-------------------
-- Dialog windows --
-------------------
local dialogTitles = {
    "^(Open File)(.*)$",
    "^(Select a File)(.*)$",
    "^(Choose wallpaper)(.*)$",
    "^(Open Folder)(.*)$",
    "^(Save As)(.*)$",
    "^(Library)(.*)$",
    "^(File Upload)(.*)$",
    "^(Rename)(.*)$",
}

for _, title in ipairs(dialogTitles) do
    hl.window_rule({
        match = { title = title },
        float = true,
        center = true,
    })
end

-------------------
--   Terminal    --
-------------------
hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.9 0.8" })

-------------------
--     Other     --
-------------------
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize",
})

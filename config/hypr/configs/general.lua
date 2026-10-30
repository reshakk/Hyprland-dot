-- ~/.config/hypr/hyprland.lua

local colors = require("configs.colors")

-- Monitors
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

-- Input
hl.config({
    input = {
        kb_layout          = "us,ru",
        kb_variant         = "",
        kb_model           = "",
        kb_options         = "grp:win_space_toggle",
        kb_rules           = "",

        follow_mouse       = 1,
        numlock_by_default = true,
        sensitivity        = -0.3,
    },
})

-- General look
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 6,
        border_size = 2,

        col = {
            active_border   = { colors = { colors.primary, colors.secondary, colors.source_color } },
            inactive_border = "rgb(0a0d0d)",
        },

        layout = "dwindle",
    },

    decoration = {
        rounding         = 10,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },
    misc = {
	force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

-- Layouts
hl.config({
    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },
})

-- Window rule: colored border for pinned windows
hl.window_rule({
     name = "pinned-border",
     match = { pin = true },
     border_color = { colors = { colors.surface_tint, colors.inverse_on_surface } },
})


-- https://wiki.hypr.land/configuring/core/environment-variables/

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

-- XDG specific environment variables are often detected through portals and applications that may set those for you,
-- however it is not a bad idea to set them explicitly.
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- GTK: Use wayland if available, fall back to x11 if not.
hl.env("GDK_BACKEND", "wayland,x11,*")

-- Qt: Use Wayland if available, fall back to X11 if not.
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- Run SDL2 applications on Wayland. Remove or set to x11 if games that provide older versions of SDL cause compatibility issues.
hl.env("SDL_VIDEODRIVER", "wayland")

-- Clutter package already has Wayland enabled, this variable will force Clutter applications to try and use the Wayland backend.
hl.env("CLUTTER_BACKEND", "wayland")

hl.env("XDG_PICTURES_DIR", "Pictures")
hl.env("HYPRSHOT_DIR", "Pictures/screenshot")

hl.env("EDITOR", "/usr/bin/nvim")
hl.env("VISUAL", "/usr/bin/nvim")

-- Disable telemetry for .NET/dotnet
hl.env("DOTNET_CLI_TELEMETRY_OPTOUT", 1)


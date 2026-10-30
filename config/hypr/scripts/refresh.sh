#!/usr/bin/env bash

# Kill already running processes
_ps=(waybar swaync hypridle rofi)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

sleep 0.2
# Relaunch waybar
waybar > /dev/null 2>&1 &

# relaunch swaync
sleep 0.2
swaync > /dev/null 2>&1 &


# relaunch hypridle
sleep 0.2
hypridle > /dev/null 2>&1 &

exit 0

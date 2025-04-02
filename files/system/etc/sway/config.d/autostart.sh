#!/bin/bash
set -e;
if ! pgrep foot >/dev/null; then
    echo "Launching Foot..." && swaymsg "exec foot";
fi
if ! pgrep thunar >/dev/null; then
    echo "Launching Thunar..." && swaymsg "exec thunar";
fi
if ! pgrep vscodium >/dev/null; then
    echo "Launching Vscodium..." && swaymsg "exec flatpak run com.vscodium.codium";
fi
if ! pgrep brave-browser >/dev/null; then
    echo "Launching Brave..." && swaymsg "exec flatpak run com.brave.Browser --enable-features=UseOzonePlatform --ozone-platform=wayland";
fi

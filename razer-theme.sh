#!/bin/bash
# Apply the theme's keyboard.rgb color to Razer devices via openrazer.
# Installed as an Omarchy theme-set hook:
#   omarchy hook install theme-set ~/.config/omarchy/themes/astro/razer-theme.sh
RGB_FILE="$HOME/.local/state/omarchy/current/theme/keyboard.rgb"
[[ -f $RGB_FILE ]] || exit 0
HEX=$(tr -d ' \n#' <"$RGB_FILE")
[[ $HEX =~ ^[0-9a-fA-F]{6}$ ]] || exit 0

python - "$HEX" <<'PY'
import sys
import openrazer.client as client

hex_color = sys.argv[1]
r, g, b = (int(hex_color[i:i+2], 16) for i in (0, 2, 4))

for device in client.DeviceManager().devices:
    if device.fx.has("static"):
        device.fx.static(r, g, b)
PY

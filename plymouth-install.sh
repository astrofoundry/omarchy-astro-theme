#!/bin/bash
# Apply the astro boot and login screens with a full-screen unlock.png.
#
# 1. `omarchy plymouth set by theme astro` installs unlock.png and the theme
#    colors into the Plymouth and SDDM themes and rebuilds the initramfs.
# 2. This script then overlays the stock omarchy.script and Main.qml with the
#    full-screen variants from this repo and rebuilds the initramfs again so
#    the boot image ships the patched script.
#
# Run as your user, not with sudo. The privileged steps ask via sudo.

set -euo pipefail

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

omarchy plymouth set by theme astro

sudo cp "$dir/plymouth/omarchy.script" /usr/share/plymouth/themes/omarchy/omarchy.script
sudo cp "$dir/sddm/Main.qml" /usr/share/sddm/themes/omarchy/Main.qml

if command -v limine-mkinitcpio >/dev/null 2>&1; then
  sudo limine-mkinitcpio
else
  sudo mkinitcpio -P
fi

echo "Full-screen boot and login screens installed."

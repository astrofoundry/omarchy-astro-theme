# Astro

An Omarchy theme with a palette derived from the flag of Bosnia and Herzegovina:
deep navy backgrounds, flag yellow (#ffcd00) as accent, Yaru-blue icons.

## Install

```bash
omarchy theme install https://github.com/astrofoundry/omarchy-astro-theme.git
omarchy hook install theme-set ~/.config/omarchy/themes/astro/razer-theme.sh
~/.config/omarchy/themes/astro/plymouth-install.sh
```

`theme install` also applies the theme. Re-run the `hook install` line after
editing `razer-theme.sh`; the hook runs from a copy.

`plymouth-install.sh` applies `unlock.png` and the theme colors to the
Plymouth boot screen and the SDDM login screen, then overlays both with the
full-screen variants from `plymouth/` and `sddm/`. It asks for sudo and
rebuilds the initramfs twice.

## Contents

- `colors.toml`: the palette. Everything else (terminals, bar, Hyprland, btop, ...) is generated from it.
- `backgrounds/`: wallpapers.
- `icons.theme`: Yaru-blue.
- `keyboard.rgb`: flag yellow for RGB keyboards.
- `unlock.png`: full-screen image for the Plymouth and SDDM screens.
- `plymouth/omarchy.script`: Plymouth script that shows `unlock.png` full screen.
- `sddm/Main.qml`: SDDM theme that shows `unlock.png` full screen.
- `plymouth-install.sh`: installs the boot and login screens.
- `razer-theme.sh`: theme-set hook that applies `keyboard.rgb` to Razer devices via openrazer (needs openrazer-daemon and python-openrazer).

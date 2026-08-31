# Astro

An Omarchy theme with a palette derived from the flag of Bosnia and Herzegovina:
deep navy backgrounds, flag yellow (#ffcd00) as accent, Yaru-blue icons.

## Install

```bash
omarchy theme install https://github.com/astrofoundry/omarchy-astro-theme.git
omarchy hook install theme-set ~/.config/omarchy/themes/astro/razer-theme.sh
omarchy plymouth set by theme astro
```

`theme install` also applies the theme. Re-run the `hook install` line after
editing `razer-theme.sh`; the hook runs from a copy.

`plymouth set by theme` applies `unlock.png` and the theme colors to the
Plymouth boot screen and the SDDM login screen. It asks for sudo and rebuilds
the initramfs.

## Contents

- `colors.toml`: the palette. Everything else (terminals, bar, Hyprland, btop, ...) is generated from it.
- `backgrounds/`: wallpapers.
- `icons.theme`: Yaru-blue.
- `keyboard.rgb`: flag yellow for RGB keyboards.
- `unlock.png`: boot logo for the Plymouth and SDDM screens.
- `razer-theme.sh`: theme-set hook that applies `keyboard.rgb` to Razer devices via openrazer (needs openrazer-daemon and python-openrazer).

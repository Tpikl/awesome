# AwesomeWM Configuration

This is a personal AwesomeWM (v4.3) configuration for an Arch Linux system.

## Structure

- `rc.lua` — Main config: keybindings, wibar, menus, window rules, signals
- `themes/archpad/theme.lua` — Custom dark theme (colors, fonts, icons)
- `themes/archpad/` — Theme assets (layout, taglist, and titlebar PNGs)

## Scope

All work should target the personal Lua files (`rc.lua`, `themes/archpad/theme.lua`).
Do **not** modify anything inside `awesome-wm-widgets/` or other third-party directories — these are external dependencies.

## Key Details

- **Terminal:** kitty
- **Editor:** nano
- **Launcher:** rofi
- **File manager:** dolphin
- **Font:** Hack 8
- **Theme palette:** Dark grays (#1F1F1F bg), light text (#DCDCCC), gold focus (#F0DFAF)
- **Layouts in use:** floating, tile, max
- **External widgets:** awesome-wm-widgets (volume widget)
- **Media bindings:** Spotify via dbus/playerctl
- **Screenshot tool:** maim
- **Screen lock:** i3lock

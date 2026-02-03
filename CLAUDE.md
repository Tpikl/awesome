# AwesomeWM Configuration

Personal AwesomeWM (v4.3) config on Arch Linux.

## Structure

```
rc.lua                  Entry point — loads theme, then config modules
config/
  vars.lua              Shared variables (terminal, editor, modkey, layouts)
  error_handling.lua    Startup/runtime error notifications
  keys.lua              Global & client keybindings
  menu.lua              Right-click & app menus
  rules.lua             Window rules
  signals.lua           Client/screen signals
  wibar.lua             Status bar & widgets
themes/
  archpad/              Default theme (dark palette, Hack font, PNG assets)
```

## Scope

- Edit `rc.lua` and files under `config/` and `themes/`.
- Do **not** modify anything inside `awesome-wm-widgets/` or other third-party directories.

## Themes

- The active theme is set in `rc.lua` via `beautiful.init()`.
- Each theme is self-contained under `themes/<name>/` (Lua config + all assets).
- Current default: **archpad**. More themes may be added later.
- Config modules (`config/*`) must not hard-code theme-specific values — they read from `beautiful` or `config.vars` so theme switching stays clean.

## Key Details

- **Terminal:** kitty
- **Editor:** nano (fallback via `$EDITOR`)
- **Launcher:** rofi
- **File manager:** dolphin
- **Modkey:** Mod4 (Super)
- **Layouts:** floating, tile, max
- **External widgets:** awesome-wm-widgets (volume)
- **Media:** Spotify via dbus/playerctl
- **Screenshot:** maim
- **Screen lock:** i3lock

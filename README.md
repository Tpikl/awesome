# ~/.config/awesome

Personal AwesomeWM configuration for Arch Linux.

## Structure

```
rc.lua                  Entry point — loads theme & config modules
config/
  vars.lua              Shared variables (terminal, editor, modkey, layouts)
  error_handling.lua    Startup/runtime error notifications
  keys.lua              Global & client keybindings
  menu.lua              Right-click & app menus
  rules.lua             Window rules
  signals.lua           Client/screen signals
  wibar.lua             Status bar & widgets
themes/
  archpad/              Default dark theme (colors, fonts, icons)
```

## Theme

The active theme is set in `rc.lua` via `beautiful.init()`.
Each theme lives in its own directory under `themes/` and is self-contained (Lua config + assets).
Current default: **archpad**.

## Dependencies

- [awesome 4.3](https://archlinux.org/packages/extra/x86_64/awesome/)
- [awesome-wm-widgets](https://github.com/streetturtle/awesome-wm-widgets) — cloned into this directory (git-ignored)
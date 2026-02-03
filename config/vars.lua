local awful = require("awful")

local vars = {}

vars.terminal = "kitty"
vars.editor = os.getenv("EDITOR") or "nano"
vars.editor_cmd = vars.terminal .. " -e " .. vars.editor
vars.modkey = "Mod4"
vars.mouse_wrap = false

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.max,
}

return vars

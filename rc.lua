pcall(require, "luarocks.loader")

-- Core libraries
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Theme (must init before config modules that use beautiful)
beautiful.init("~/.config/awesome/themes/archpad/theme.lua")

-- Configuration modules
local vars = require("config.vars")
require("config.error_handling")
local menu = require("config.menu")
require("config.wibar")
local keys = require("config.keys")
require("config.rules")
require("config.signals")

-- Menubar terminal
menubar.utils.terminal = vars.terminal

-- Root bindings
root.keys(keys.globalkeys)
root.buttons(gears.table.join(
    awful.button({}, 3, function() menu.mainmenu:toggle() end)
))

-- Autostart
awful.spawn.with_shell("~/.fehbg &")

local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local vars = require("config.vars")

local menu = {}

local appsmenu = {
    { "firefox", "firefox" },
    { "discord", "discord" },
}

local musicmenu = {
    { "spotify", "spotify" },
}

local gamesmenu = {
    { "[ steam ]", "steam" },
    { "[ lutris ]", "lutris" },
    { "Minecraft", "minecraft-launcher" },
}

local toolsmenu = {
    { "vscode", "code" },
}

local systemmenu = {
    { "explorer", "dolphin" },
    { "sound", "pavucontrol" },
}

local awesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", vars.terminal .. " -e man awesome" },
    { "edit config", vars.editor_cmd .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

menu.mainmenu = awful.menu({
    items = {
        { vars.terminal, vars.terminal },
        { "apps", appsmenu },
        { "music", musicmenu },
        { "games", gamesmenu },
        { "tools", toolsmenu },
        { "system", systemmenu },
        { "awesome", awesomemenu, beautiful.awesome_icon },
        { "power", {
            { "sleep", "systemctl suspend" },
            { "restart", "reboot" },
            { "shutdown", "shutdown now" },
        }},
    },
})

menu.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = menu.mainmenu,
})

return menu

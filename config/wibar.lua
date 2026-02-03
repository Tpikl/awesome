local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local vars = require("config.vars")

local volume_control = require("awesome-wm-widgets.volume-widget.volume")

local wibar = {}

-- Instantiate volume widget for the panel
wibar.volume_widget = volume_control({
    display_notification = true,
    volume_audio_controller = "alsa_only",
    widget_type = "arc",
})

-- Expose the control object for keybindings (inc/dec/toggle)
wibar.volume_control = volume_control

-- Taglist buttons
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ vars.modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ vars.modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- Tasklist buttons
local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", { raise = true })
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function() awful.client.focus.byidx(1) end),
    awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
)

-- Screen setup
awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "0", "1", "2", "3" }, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)
    ))

    s.mytaglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    })

    s.mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    })

    s.mywibox = awful.wibar({ position = "top", screen = s })

    s.mywibox:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle
        { -- Right
            layout = wibox.layout.fixed.horizontal,
            wibar.volume_widget,
            wibox.widget.systray(),
            s.mylayoutbox,
            wibox.widget.textclock("%a %b %d, %H:%M:%S", 1),
        },
    })
end)

return wibar

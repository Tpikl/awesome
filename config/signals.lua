local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Place new clients; prevent offscreen after screen changes
client.connect_signal("manage", function(c)
    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

-- Titlebar setup (used when titlebars_enabled = true in rules)
client.connect_signal("request::titlebars", function(c)
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c):setup({
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Middle
            {
                align = "center",
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal,
        },
        { -- Right
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal(),
        },
        layout = wibox.layout.align.horizontal,
    })
end)

-- Sloppy focus (focus follows mouse)
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

-- Border color on focus/unfocus
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Rounded corners
client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 3)
    end
end)

-- Mouse wrapping across monitor edges (toggle via vars.mouse_wrap)
local vars = require("config.vars")
local mouse_wrap_timer = gears.timer({ timeout = 1/60 })
mouse_wrap_timer:connect_signal("timeout", function()
    local min_x, min_y = math.huge, math.huge
    local max_x, max_y = -math.huge, -math.huge
    for s in screen do
        local g = s.geometry
        min_x = math.min(min_x, g.x)
        min_y = math.min(min_y, g.y)
        max_x = math.max(max_x, g.x + g.width)
        max_y = math.max(max_y, g.y + g.height)
    end

    local pos = mouse.coords()
    local new_pos = nil

    if pos.x <= min_x then
        new_pos = { x = max_x - 2, y = pos.y }
    elseif pos.x >= max_x - 1 then
        new_pos = { x = min_x + 1, y = pos.y }
    end

    if pos.y <= min_y then
        new_pos = new_pos or { x = pos.x, y = nil }
        new_pos.y = max_y - 2
        new_pos.x = new_pos.x or pos.x
    elseif pos.y >= max_y - 1 then
        new_pos = new_pos or { x = pos.x, y = nil }
        new_pos.y = min_y + 1
        new_pos.x = new_pos.x or pos.x
    end

    if new_pos then
        mouse.coords(new_pos)
    end
end)
if vars.mouse_wrap then
    mouse_wrap_timer:start()
end

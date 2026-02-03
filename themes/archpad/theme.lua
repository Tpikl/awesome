-------------------------------
--  "ArchPad" awesome theme  --
--    By Adrian C. (anrxc)   --
--  -- Modified By: Pikl --  --
-------------------------------

local gears = require("gears")


local dpi = require("beautiful.xresources").apply_dpi
--local battery_widget = require("awesome-wm-widgets.battery-widget.battery")


local base_path = "~/.config/awesome/themes/archpad/"

local focus  = "#5F5F5F"
local normal = "#1F1F1F"

-- {{{ Main
local theme = {}
--theme.wallpaper = base_path .. "wallhaven-eymzjk.jpg"
-- }}}

-- {{{ Styles
theme.font      = "Hack 8"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#F0DFAF"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = normal
theme.bg_focus   = focus
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(4)
theme.border_width  = dpi(1)
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#DDDDDD"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = focus
theme.titlebar_bg_normal = normal
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = base_path .. "taglist/squarefz.png"
theme.taglist_squares_unsel = base_path .. "taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = base_path .. "awesome-icon.png"
theme.menu_submenu_icon      = base_path .. "submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = base_path .. "layouts/tile.png"
theme.layout_tileleft   = base_path .. "layouts/tileleft.png"
theme.layout_tilebottom = base_path .. "layouts/tilebottom.png"
theme.layout_tiletop    = base_path .. "layouts/tiletop.png"
theme.layout_fairv      = base_path .. "layouts/fairv.png"
theme.layout_fairh      = base_path .. "layouts/fairh.png"
theme.layout_spiral     = base_path .. "layouts/spiral.png"
theme.layout_dwindle    = base_path .. "layouts/dwindle.png"
theme.layout_max        = base_path .. "layouts/max.png"
theme.layout_fullscreen = base_path .. "layouts/fullscreen.png"
theme.layout_magnifier  = base_path .. "layouts/magnifier.png"
theme.layout_floating   = base_path .. "layouts/floating.png"
theme.layout_cornernw   = base_path .. "layouts/cornernw.png"
theme.layout_cornerne   = base_path .. "layouts/cornerne.png"
theme.layout_cornersw   = base_path .. "layouts/cornersw.png"
theme.layout_cornerse   = base_path .. "layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = base_path .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = base_path .. "titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = base_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = base_path .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = base_path .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = base_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = base_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = base_path .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = base_path .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = base_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = base_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = base_path .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = base_path .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = base_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = base_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = base_path .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = base_path .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = base_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = base_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = base_path .. "titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

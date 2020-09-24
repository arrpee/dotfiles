-- Imports
local lain = require("lain")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local icons = require("utils.icons")
local toggle_icon_widget = require("utils.toggle_icon_widget")

-- Clock Widget
local textclock = wibox.widget.textclock(lain.util.markup(beautiful.fg_normal, " %H:%M "), 60)

local clock_widget = create_toggle_icon_widget(true, icons.time, textclock, true)

return clock_widget

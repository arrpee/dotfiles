-- Imports
local lain = require("lain")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

-- Clock Widget
local textclock = wibox.widget.textclock(lain.util.markup(beautiful.fg_normal, " %H:%M"), 60)
local clock_widget = wibox.container.margin(textclock, dpi(0), dpi(0))

return clock_widget

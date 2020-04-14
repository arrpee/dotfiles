-- Imports
local naughty = require("naughty")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local dpi = require("beautiful").xresources.apply_dpi

-- Config for Naughty
naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = dpi(40)
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.timeout = 6
naughty.config.defaults.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(6))
end
naughty.config.padding = dpi(14)
naughty.config.spacing = dpi(5)
naughty.config.defaults.position = "top_right"
naughty.config.presets.critical = {
    border_color = beautiful.notification_border_width_critical
}

-- Error Handling (Startup and Normal)
if awesome.startup_errors then
    naughty.notify(
        {
            preset = naughty.config.presets.critical,
            title = "Startup Errors!",
            text = awesome.startup_errors
        }
    )
end

do
    local in_error = false
    awesome.connect_signal(
        "debug::error",
        function(err)
            if in_error then
                return
            end
            in_error = true

            naughty.notify(
                {
                    preset = naughty.config.presets.critical,
                    title = "Something went wrong!",
                    text = tostring(err)
                }
            )
            in_error = false
        end
    )
end

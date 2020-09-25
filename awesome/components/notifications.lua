local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = beautiful.xresources
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

-- Naughty Config
naughty.config.padding = dpi(8)
naughty.config.spacing = dpi(5)

-- Naughty Config Defaults
naughty.config.defaults.icon_size = dpi(40)
naughty.config.defaults.margin = dpi(8)
naughty.config.defaults.border_width = dpi(2)

naughty.config.defaults.max_width = dpi(500)
naughty.config.defaults.max_height = dpi(300)
naughty.config.defaults.ontop = true
naughty.config.defaults.position = "top_right"
naughty.config.defaults.icon = nil

naughty.config.defaults.timeout = 6
naughty.config.defaults.hover_timeout = 15

-- Naughty Presets
naughty.config.presets.critical.bg = xrdb.color1
naughty.config.presets.critical.timeout = 15

-- Error handling
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

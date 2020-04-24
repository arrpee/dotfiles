-- Imports
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

-- Use widgets
local taglist = require("widgets.taglist")
local tasklist = require("widgets.tasklist")
local tasklist = require("widgets.tasklist")
local date = require("widgets.date")
local time = require("widgets.time")
local volume = require("widgets.volume")
local systray = require("widgets.systray")

-- Separator Widgets
local boundary_sep =
    wibox.widget {
    opacity = 0,
    widget = wibox.widget.separator,
    forced_width = dpi(15)
}

local sep =
    wibox.widget {
    color = beautiful.bg_normal,
    shape = gears.rounded_bar,
    widget = wibox.widget.separator,
    forced_width = dpi(20)
}

-- Bar Creation
local TopPanel = function(s)
    local panel =
        awful.wibar {
        position = "top",
        ontop = false,
        screen = s,
        height = dpi(30),
        width = s.geometry.width,
        stretch = false,
        bg = beautiful.bg_normal,
        fg = beautiful.fg_normal
    }

    panel:struts(
        {
            top = dpi(30)
        }
    )

    panel:setup {
        expand = "none",
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            boundary_sep,
            taglist(s),
            sep,
            tasklist(s)
        },
        {
            layout = wibox.layout.align.horizontal
        },
        {
            layout = wibox.layout.fixed.horizontal,
            time,
            sep,
            date,
            sep,
            volume,
            sep,
            systray,
            boundary_sep
        }
    }

    return panel
end

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(
    function(s)
        s.top_panel = TopPanel(s)
    end
)

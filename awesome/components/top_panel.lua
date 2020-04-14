-- Imports
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi

-- Use widgets
local taglist = require("widgets.taglist")
local tasklist = require("widgets.tasklist")
local volume = require("widgets.volume")
local systray = require("widgets.systray")

-- Separator Widget
local sep =
    wibox.widget {
    markup = "  ",
    widget = wibox.widget.textbox
}

-- Bar Creation
local TopPanel = function(s)
    local panel =
        awful.wibar {
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
            tasklist
        },
        taglist,
        {
            layout = wibox.layout.fixed.horizontal,
            volume,
            sep,
            systray
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

-- Imports
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = beautiful.xresources
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gears = require("gears")
local keys = require("keys")

-- Taglist widget
local create_taglist = function(s)
    local taglist =
        awful.widget.taglist(
        s,
        function(t)
            return t.selected or #t:clients() > 0
        end,
        keys.taglist_buttons,
        {
            font = beautiful.base_font .. "10",
            fg_focus = beautiful.fg_focus,
            bg_focus = beautiful.bg_focus .. "77",
            bg_urgent = xrdb.color1,
            spacing = 0,
            shape = gears.shape.rectangle,
            layout = wibox.layout.align.horizontal
        }
    )

    return {
        {
            {
                taglist,
                margins = dpi(2),
                widget = wibox.container.margin
            },
            shape = gears.shape.rectangle,
            shape_border_color = beautiful.fg_focus,
            shape_border_width = dpi(2),
            widget = wibox.container.background
        },
        left = dpi(6),
        right = dpi(6),
        bottom = dpi(3),
        top = dpi(3),
        widget = wibox.container.margin
    }
end

return create_taglist

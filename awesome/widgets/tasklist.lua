-- Imports
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local keys = require("keys")

-- Tasklist widget
local create_tasklist = function(s)
    local tasklist =
        awful.widget.tasklist(
        s,
        awful.widget.tasklist.filter.currenttags,
        keys.tasklist_buttons,
        {
            spacing = 5,
            align = "left",
            shape = function(cr, width, height, radius)
                return gears.shape.transform(gears.shape.rectangle):translate(-3, 0)(cr, width, height, radius)
            end,
            layout = wibox.layout.align.horizontal
        }
    )

    return {
        tasklist,
        left = dpi(6),
        right = dpi(6),
        bottom = dpi(1),
        top = dpi(1),
        widget = wibox.container.margin
    }
end

return create_tasklist

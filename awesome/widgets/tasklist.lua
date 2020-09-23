-- Imports
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local keys = require("keys")

-- Tasklist widget
local tasklist = function(s)
    return awful.widget.tasklist(
        1,
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
end

return tasklist

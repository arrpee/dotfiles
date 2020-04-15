-- Imports
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local keys = require("keys")

-- Taglist widget
local taglist = function(s)
    return awful.widget.taglist(
        s,
        function(t)
            return t.selected or #t:clients() > 0
        end,
        keys.taglist_buttons,
        {
            spacing = 0,
            shape = gears.shape.rectangle,
            layout = wibox.layout.align.horizontal
        }
    )
end

return taglist

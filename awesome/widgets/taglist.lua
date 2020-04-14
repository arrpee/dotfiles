-- Imports
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local keys = require("keys")

-- Taglist widget
local taglist =
    awful.widget.taglist(
    1,
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

return taglist

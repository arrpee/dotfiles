-- Imports
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local keys = require("keys")

-- Tasklist widget
local tasklist =
    awful.widget.tasklist(
    1,
    awful.widget.tasklist.filter.currenttags,
    keys.tasklist_buttons,
    {
        spacing = 4,
        align = "left",
        shape = gears.shape.rectangle,
        layout = wibox.layout.align.horizontal
    }
)

return tasklist

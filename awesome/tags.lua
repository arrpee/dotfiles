-- Imports
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

-- Define Tags
local tags = {
    {
        name = " Web ",
        screen = 1
    },
    {
        name = " Code ",
        screen = 1
    },
    {
        name = " Other ",
        screen = 1
    },
    {
        name = " Misc ",
        screen = 2
    },
    {
        name = " Music ",
        screen = 2
    },
    {
        name = " Friends ",
        screen = 2
    }
}

-- Define tag layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating
}

-- Apply tag settings to each tag
for i, tag in pairs(tags) do
    awful.tag.add(
        i,
        {
            name = tag.name,
            layout = awful.layout.layouts[1],
            screen = tag.screen,
            selected = i == 1
        }
    )
end
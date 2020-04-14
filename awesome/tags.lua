-- Imports
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

-- Define Tags
local tags = {
    {
        name = " 1 "
    },
    {
        name = " 2 "
    },
    {
        name = " 3 "
    },
    {
        name = " 4 "
    },
    {
        name = " 5 "
    },
    {
        name = " 6 ",
        floating = true
    }
}

-- Define tag layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating
}

-- Apply tag settings to each tag
awful.screen.connect_for_each_screen(
    function(s)
        for i, tag in pairs(tags) do
            awful.tag.add(
                i,
                {
                    name = tag.name,
                    layout = tag.floating and awful.layout.layouts[2] or awful.layout.layouts[1],
                    screen = s,
                    selected = i == 1
                }
            )
        end
    end
)

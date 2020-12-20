-- Imports
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")

-- Start with awesomewm
beautiful.init(awful.util.getdir("config") .. "/theme.lua")

-- Use components
require("components.notifications")
require("components.titlebar")
require("components.top_panel")
require("components.wallpaper")

-- Use rules and keys
awful.rules.rules = require("rules")
local keys = require("keys")

-- Define Tags
require("tags")

-- Main window manage function
client.connect_signal(
    "manage",
    function(c)
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        if not awesome.startup then
            awful.client.setslave(c)
        end

        -- Rounded Corners
        if c.fullscreen == true then
            c.shape = gears.shape.rectangle
        else
            c.shape = function(cr, w, h)
                gears.shape.rounded_rect(cr, w, h, 8)
            end
        end

        -- Prevent clients from being unreachable after screen count changes.
        if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_offscreen(c)
        end

        -- Reapply rules on class change.
        if c.class == nil then
            c.minimized = true
            c:connect_signal(
                "property::class",
                function()
                    c.minimized = false
                    awful.rules.apply(c)
                end
            )
        end
    end
)

-- Move tags automatically
client.connect_signal("property::urgent", function(c)
    local count = 0
    for _ in pairs(c.screen.clients) do count = count + 1 end
    if count == 0 then
        c:jump_to()
    end
end)

-- Garbage Collection
collectgarbage("setpause", 160)
collectgarbage("setstepmul", 400)

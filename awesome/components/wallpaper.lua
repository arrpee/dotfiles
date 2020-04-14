-- Imports
local awful = require("awful")
local naughty = require("naughty")
local apps = require("apps")

-- Set wallpaper function
local function set_wallpaper()
    awful.spawn.with_shell(apps.change_wallpaper)
end

-- Initial call
set_wallpaper()

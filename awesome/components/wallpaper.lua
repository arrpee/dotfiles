-- Imports
local awful = require("awful")
local gears = require("gears")
local apps = require("apps")

-- Set wallpaper function
local function set_wallpaper()
    awful.spawn.with_shell(apps.change_wallpaper)
end

-- Initial call
gears.timer {
    timeout = 3600,
    call_now = true,
    autostart = true,
    callback = set_wallpaper
}

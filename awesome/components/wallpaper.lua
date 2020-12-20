-- Imports
local awful = require("awful")
local gears = require("gears")

-- Set wallpaper function
function set_wallpaper()
    awful.spawn.with_shell("feh --randomize --no-xinerama --bg-scale ~/Pictures/Wallpapers")
end

-- Initial call
gears.timer {
    timeout = 3600,
    call_now = true,
    autostart = true,
    callback = set_wallpaper
}

return set_wallpaper

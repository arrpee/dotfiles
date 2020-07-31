-- Imports
local awful = require("awful")
local gears = require("gears")

-- Set wallpaper function
local function set_wallpaper()
    if os.date("*t").hour > 9 and os.date("*t").hour < 21 then
        awful.spawn.with_shell("feh --randomize --bg-scale ~/Pictures/Wallpapers/Day")
    else
        awful.spawn.with_shell("feh --randomize --bg-scale ~/Pictures/Wallpapers/Night")
    end
end

-- Initial call
gears.timer {
    timeout = 3600,
    call_now = true,
    autostart = true,
    callback = set_wallpaper
}

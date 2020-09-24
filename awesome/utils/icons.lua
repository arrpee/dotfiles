local awful = require("awful")

local icon_path = awful.util.getdir("config") .. "/icons/"

return {
    spotify = icon_path .. "/widgets/spotify.svg",
    memory = icon_path .. "/widgets/memory.svg",
    cpu = icon_path .. "/widgets/cpu.svg",
    volume = icon_path .. "/widgets/volume.svg",
    systray = icon_path .. "/widgets/systray.svg",
    time = icon_path .. "/widgets/time.svg",
    calendar = icon_path .. "/widgets/calendar.svg"
}

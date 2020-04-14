-- Imports
local awful = require("awful")
local filesystem = require("gears.filesystem")

-- App Declarations
local apps = {
    terminal = "urxvt",
    browser = "google-chrome-stable",
    editor = "code",
    music_player = "spotify",
    launcher = "rofi -theme arrpee -modi drun,run -show drun",
    switcher = "rofi -theme arrpee -modi window -show window",
    screenshot = "flameshot gui",
    change_wallpaper = "feh --randomize --bg-scale ~/Pictures/Wallpapers"
}

-- List of apps to start once on start-up
local run_on_start_up = {
    "pulseaudio",
    "picom --experimental-backends",
    "nm-applet"
}

-- Run all the apps listed in run_on_start_up when awesome starts
local function run_once(cmd)
    local findme = cmd
    local firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace - 1)
    end
    awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd), false)
end

for _, app in ipairs(run_on_start_up) do
    run_once(app)
end

return apps

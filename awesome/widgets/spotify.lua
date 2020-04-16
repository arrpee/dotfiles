-------------------------------------------------
-- Spotify Widget for Awesome Window Manager
-- Shows currently playing song on Spotify for Linux client
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/spotify-widget

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")

local GET_CURRENT_SONG_CMD = "sp current-oneline"

spotify_widget =
    wibox.widget {
    {
        id = "current_song",
        widget = wibox.widget.textbox
    },
    layout = wibox.layout.align.horizontal,
    set_text = function(self, path)
        self.current_song.markup = path
    end
}

local update_widget_text = function(widget, stdout, _, _, _)
    if string.find(stdout, "Error: Spotify is not running.") ~= nil then
        widget:set_text("")
        widget:set_visible(false)
    else
        widget:set_text("  " .. stdout)
        widget:set_visible(true)
    end
end

awful.widget.watch(GET_CURRENT_SONG_CMD, 1, update_widget_text, spotify_widget)

--- Adds mouse controls to the widget:
--  - left click - play/pause
--  - scroll up - play next song
--  - scroll down - play previous song
spotify_widget:connect_signal(
    "button::press",
    function(_, _, _, button)
        if (button == 1) then
            awful.spawn("sp play", false) -- left click'
        elseif (button == 4) then
            awful.spawn("sp next", false) -- scroll up
        elseif (button == 5) then
            awful.spawn("sp prev", false) -- scroll down
        end
    end
)

return spotify_widget

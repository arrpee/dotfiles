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
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local icons = require("utils.icons")

local GET_CURRENT_SONG_CMD = "sp current-oneline"

local icon =
    wibox.widget {
    {
        {
            image = icons.spotify,
            widget = wibox.widget.imagebox
        },
        margins = dpi(4),
        layout = wibox.container.margin
    },
    bg = xrdb.color10,
    widget = wibox.container.background
}

local spotify_widget =
    wibox.widget {
    icon,
    {
        id = "current_song",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    },
    layout = wibox.layout.align.horizontal,
    set_text = function(self, text)
        self.current_song.text = text
    end
}

local update_widget_text = function(widget, stdout, _, _, _)
    if string.find(stdout, "Error: Spotify is not running.") ~= nil then
        widget:set_text("")
        widget:set_visible(false)
    else
        local text = " " .. stdout:sub(1, -2) .. " "
        widget:set_text(text)
        widget:set_visible(true)
    end
end

awful.widget.watch(GET_CURRENT_SONG_CMD, 1, update_widget_text, spotify_widget)

spotify_widget:connect_signal(
    "button::press",
    function(_, _, _, button)
        if (button == 1) then
            awful.spawn("sp play", false) -- left click'
        elseif (button == 4) then
            awful.spawn("sp prev", false) -- scroll up
        elseif (button == 5) then
            awful.spawn("sp next", false) -- scroll down
        end
    end
)

full_widget = {
    {
        spotify_widget,
        shape = gears.shape.rectangle,
        shape_border_color = xrdb.color10,
        shape_border_width = dpi(2),
        widget = wibox.container.background
    },
    left = dpi(6),
    right = dpi(6),
    bottom = dpi(3),
    top = dpi(3),
    widget = wibox.container.margin
}

return full_widget

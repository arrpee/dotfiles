-- Imports
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local icons = require("utils.icons")
local toggle_icon_widget = require("utils.toggle_icon_widget")

-- Lock Widget Widget
local text =
    wibox.widget {
    text = " Disabled ",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local lock_widget =
    create_toggle_icon_widget(
    false,
    icons.lock,
    text,
    true,
    beautiful.fg_normal,
    function()
        awful.spawn.easy_async_with_shell(
            "xautolock -disable",
            function()
            end
        )
    end,
    function()
        awful.spawn.easy_async_with_shell(
            "xautolock -enable",
            function()
            end
        )
    end
)

return lock_widget

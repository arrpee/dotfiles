-- Imports
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local icons = require("utils.icons")
local toggle_icon_widget = require("utils.toggle_icon_widget")

-- CPU Widget
local cpu =
    lain.widget.cpu {
    timeout = 1,
    settings = function()
        widget:set_markup(" " .. cpu_now.usage .. "% ")
    end
}

local cpu_widget = create_toggle_icon_widget(true, icons.cpu, cpu.widget, false)

return cpu_widget

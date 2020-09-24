-- Imports
local lain = require("lain")
local awful = require("awful")
local icons = require("utils.icons")
local toggle_icon_widget = require("utils.toggle_icon_widget")

-- RAM Widget
local ram =
    lain.widget.mem {
    timeout = 1,
    settings = function()
        widget:set_markup(" " .. mem_now.perc .. "% ")
    end
}

local ram_widget = create_toggle_icon_widget(true, icons.memory, ram.widget, true)

return ram_widget

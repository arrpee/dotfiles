-- Imports
local lain = require("lain")
local awful = require("awful")

-- RAM Widget
local ram =
    lain.widget.mem {
    timeout = 1,
    settings = function()
        widget:set_markup(" " .. mem_now.perc .. "%")
    end
}

return ram

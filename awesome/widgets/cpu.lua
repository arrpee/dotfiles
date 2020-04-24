-- Imports
local lain = require("lain")
local awful = require("awful")

-- CPU Widget
local cpu =
    lain.widget.cpu {
    timeout = 1,
    settings = function()
        widget:set_markup(" " .. cpu_now.usage .. "%")
    end
}

return cpu

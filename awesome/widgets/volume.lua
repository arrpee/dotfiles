-- Imports
local lain = require("lain")
local awful = require("awful")

-- Volume Widget
local volume =
    lain.widget.pulse {
    timeout = 1,
    settings = function()
        vol = math.floor(((tonumber(volume_now.left) or 100) + (tonumber(volume_now.right) or 100)) / 2)
        if volume_now.muted == "yes" then
            vlevel = "  "
        elseif vol > 55 then
            vlevel = " " .. vol .. "%"
        elseif vol > 10 then
            vlevel = " " .. vol .. "%"
        else
            vlevel = " " .. vol .. "%"
        end
        widget:set_markup(vlevel)
    end
}

return volume

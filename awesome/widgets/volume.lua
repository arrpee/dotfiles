-- Imports
local lain = require("lain")
local os = require("os")
local awful = require("awful")
local icons = require("utils.icons")
local toggle_icon_widget = require("utils.toggle_icon_widget")

-- Volume Widget
local volume =
    lain.widget.pulse {
    timeout = 1,
    settings = function()
        vol = math.floor(((tonumber(volume_now.left) or 100) + (tonumber(volume_now.right) or 100)) / 2)
        if volume_now.muted == "yes" then
            vlevel = "  "
        else
            vlevel = " " .. vol .. "% "
        end
        widget:set_markup(vlevel)
    end
}

volume.widget:connect_signal(
    "button::press",
    function(_, _, _, button)
        if (button == 1) then
            os.execute(string.format("pactl set-sink-mute %s toggle", volume.device))
        end
    end
)
if volume.display_notification then
    volume.widget:connect_signal(
        "mouse::enter",
        function()
            show()
        end
    )
    volume.widget:connect_signal(
        "mouse::leave",
        function()
            naughty.destroy(volume.notification)
        end
    )
end

local volume_widget = create_toggle_icon_widget(true, icons.volume, volume.widget, false)

return volume_widget

-- Imports
local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
-- Toggle Widget
function create_toggle_icon_widget(on_by_default, icon, widget, right, colour)
    colour = colour or beautiful.fg_normal

    if not on_by_default then
        widget.visible = false
    end

    local icon =
        wibox.widget {
        {
            {
                image = icon,
                widget = wibox.widget.imagebox
            },
            margins = dpi(6),
            layout = wibox.container.margin
        },
        bg = colour,
        widget = wibox.container.background
    }

    local toggle_widget = wibox.widget {}

    if right then
        toggle_widget =
            wibox.widget {
            icon,
            {
                id = "text",
                widget = widget
            },
            layout = wibox.layout.align.horizontal,
            toggle_visible = function(self)
                self.text.visible = not self.text.visible
            end
        }
    else
        toggle_widget =
            wibox.widget {
            {
                id = "text",
                widget = widget
            },
            icon,
            layout = wibox.layout.align.horizontal,
            toggle_visible = function(self)
                self.text.visible = not self.text.visible
            end
        }
    end

    icon:connect_signal(
        "button::press",
        function(_, _, _, button)
            if (button == 1) then
                toggle_widget:toggle_visible()
            end
        end
    )

    full_widget = {
        {
            toggle_widget,
            shape = gears.shape.rectangle,
            shape_border_color = colour,
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
end

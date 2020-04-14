-- Imports
local wibox = require("wibox")
local awful = require("awful")

-- Toggle Widget
function create_toggle_widget(on_by_default, on_text, off_text, on_action, off_action, widget)
    if on_by_default then
        start_markup = on_text
    else
        start_markup = off_text
    end

    local toggle_widget =
        wibox.widget {
        markup = start_markup,
        widget = widget
    }

    toggle_widget:connect_signal(
        "button::press",
        function()
            if toggle_widget.markup == off_text then
                on_action(toggle_widget)
                toggle_widget.markup = on_text
            else
                off_action(toggle_widget)
                toggle_widget.markup = off_text
            end
        end
    )

    return toggle_widget
end

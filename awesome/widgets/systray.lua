-- Imports
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local toggle_widget = require("utils.toggle_widget")

-- Systray Widget
local systray = wibox.widget.systray(true)
systray.visible = false
systray.set_base_size(32)
systray.set_horizontal(true)
local systray_widget =
    create_toggle_widget(
    false,
    "   ",
    "   ",
    function()
        systray.visible = true
    end,
    function()
        systray.visible = false
    end,
    wibox.widget.textbox
)

return {
    systray,
    systray_widget,
    layout = wibox.layout.align.horizontal
}

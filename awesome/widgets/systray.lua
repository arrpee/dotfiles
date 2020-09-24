-- Imports
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi
local icons = require("utils.icons")
local toggle_icon_widget = require("utils.toggle_icon_widget")

-- Systray Widget
local systray = wibox.widget.systray(true)
systray.set_base_size(22)
systray.set_horizontal(true)
systray.visible = true

local systray_widget = create_toggle_icon_widget(false, icons.systray, systray, false)

return systray_widget

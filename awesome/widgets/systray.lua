-- Imports
local wibox = require("wibox")

-- Systray Widget
local systray = wibox.widget.systray(true)
systray.set_base_size(28)
systray.set_horizontal(true)

return systray

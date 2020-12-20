-- Imports
local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- Layout Widget
local create_layoutbox = function(s)
    local layout_widget = awful.widget.layoutbox(s)
    layout_widget.expand = 'outside'

    local p = awful.popup {
        screen = s,
            widget = wibox.widget{
                wibox.widget{
                    widget = awful.widget.layoutlist {
                        source      = awful.widget.layoutlist.source.default_layouts,
                        screen      = 1,
                        base_layout = wibox.widget {
                            spacing         = 5,
                            forced_num_cols = 3,
                            layout          = wibox.layout.flex.vertical,
                        },
                        widget_template = {
                            {
                                {
                                    id            = 'icon_role',
                                    forced_height = 24,
                                    forced_width  = 24,
                                    widget        = wibox.widget.imagebox,
                                },
                                margins = dpi(4),
                                widget  = wibox.container.margin,
                            },

                            {
                                id            = 'text_role',
                                forced_height = 24,
                                forced_width  = 24,
                                widget        = wibox.widget.textbox,
                            },
                            id              = 'background_role',
                            forced_width    = 24,
                            forced_height   = 24,
                            shape           = gears.shape.rounded_rect,
                            widget          = wibox.container.background,
                        },
                    },
            },
            margins = dpi(8),
            widget  = wibox.container.margin,
        },
        visible = false,
        ontop = true,
        hide_on_right_click = true,
        preferred_positions = 'bottom',
        border_color      = beautiful.notification_border_color,
        border_width      = beautiful.border_width,
        shape             = function(cr, width, height)
            return gears.shape.infobubble(cr, width, height, 3, 5, 5)
        end,
    }
    p:bind_to_widget(layout_widget)

    return {
        layout_widget,
        left = dpi(6),
        right = dpi(6),
        bottom = dpi(6),
        top = dpi(6),
        widget = wibox.container.margin
    }
end

return create_layoutbox
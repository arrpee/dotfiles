-- Imports
local awful = require("awful")
local beautiful = require("beautiful")
local keys = require("keys")

local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

-- Rules
rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            keys = keys.clientkeys,
            buttons = keys.clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.centered
        }
    },
    {
        rule_any = {type = {"normal"}},
        properties = {titlebars_enabled = true}
    },
    -- Floating clients.
    {
        rule_any = {
            class = {
                "Nm-connection-editor"
            },
            name = {
                "Steam Guard - Computer Authorization Required"
            },
            role = {
                "pop-up",
                "GtkFileChooserDialog"
            },
            type = {
                "dialog"
            }
        },
        properties = {floating = true}
    },
    -- Centered clients
    {
        rule_any = {
            class = {
                "Nm-connection-editor",
                "Pavucontrol"
            },
            role = {
                "GtkFileChooserDialog"
            },
            type = {
                "dialog"
            }
        },
        properties = {},
        callback = function(c)
            awful.placement.centered(c, {honor_padding = true, honor_workarea = true})
        end
    },
    -- "Move to tag"
    -- These clients will move to their tag when they appear
    {
        rule_any = {
            class = {
                "Google-chrome"
            }
        },
        properties = {screen = 1, tag = " Web "}
    },
    {
        rule_any = {
            class = {
                "Code"
            }
        },
        properties = {screen = 1, tag = " Code "}
    },
    {
        rule_any = {
            class = {
                "[Ss]potify"
            }
        },
        properties = {screen = 2, tag = " Music "}
    },
    {
        rule_any = {
            class = {
                "discord"
            }
        },
        properties = {screen = 2, tag = " Friends "}
    },
    -- Rofi
    {
        rule_any = {name = {"rofi"}},
        properties = {maximized = true, ontop = true}
    },
    -- File chooser dialog
    {
        rule_any = {role = {"GtkFileChooserDialog"}},
        properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.65}
    }
}

return rules

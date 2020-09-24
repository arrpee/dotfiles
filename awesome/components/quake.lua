local awful = require("awful")
local lain = require("lain")

awful.screen.connect_for_each_screen(
    function(s)
        -- Quake application
        s.quake =
            lain.util.quake {
            app = "urxvt",
            overlap = "true",
            height = 0.7,
            width = 0.7,
            vert = "center",
            horiz = "center"
        }
    end
)

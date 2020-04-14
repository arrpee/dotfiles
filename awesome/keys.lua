-- Imports
local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup").widget

-- Use applications
local apps = require("apps")

-- Define mod keys
local modkey = "Mod1"
local modkey2 = "Mod4"

-- Declare all combinations
local keys = {}

-- Mouse buttons on the desktop
keys.desktopbuttons =
    gears.table.join(
    -- left click on desktop to hide notification
    awful.button(
        {},
        1,
        function()
            naughty.destroy_all_notifications()
        end
    )
)

-- Mouse buttons on the client
keys.clientbuttons =
    gears.table.join(
    awful.button(
        {},
        1,
        function(c)
            client.focus = c
            c:raise()
        end
    ),
    awful.button({modkey}, 1, awful.mouse.client.move),
    awful.button({modkey}, 3, awful.mouse.client.resize)
)

-- Mouse buttons on tags
keys.taglist_buttons =
    gears.table.join(
    awful.button(
        {},
        1,
        function(t)
            t:view_only()
        end
    ),
    awful.button({}, 3, awful.tag.viewtoggle)
)

-- Mouse buttons on tasks
keys.tasklist_buttons =
    gears.table.join(
    awful.button(
        {},
        1,
        function(c)
            if c == client.focus then
                c.minimized = true
            else
                c.minimized = false
                if not c:isvisible() then
                    awful.tag.viewonly(c:tags()[1])
                end
                client.focus = c
                c:raise()
            end
        end
    ),
    awful.button(
        {},
        2,
        function(c)
            clients = c.screen.get_clients()
            for _, client in pairs(clients) do
                client.minimized = true
            end
            c:jump_to(false)
        end
    ),
    awful.button(
        {},
        3,
        function(c)
            c:kill()
        end
    )
)

-- Keyboard buttons across awesomewm
keys.globalkeys =
    gears.table.join(
    -- Spawn terminal
    awful.key(
        {modkey},
        "Return",
        function()
            awful.spawn(apps.terminal)
        end,
        {description = "open a terminal", group = "launcher"}
    ),
    -- Launch rofi
    awful.key(
        {modkey},
        "space",
        function()
            awful.spawn(apps.launcher)
        end,
        {description = "application launcher", group = "launcher"}
    ),
    awful.key(
        {modkey},
        "Tab",
        function()
            awful.spawn(apps.switcher)
        end,
        {description = "application switcher", group = "launcher"}
    ),
    -- Launch apps
    awful.key(
        {modkey},
        "F1",
        function()
            awful.spawn(apps.browser)
        end,
        {description = "launch browser", group = "launcher"}
    ),
    awful.key(
        {modkey},
        "F2",
        function()
            awful.spawn(apps.editor)
        end,
        {description = "launch editor", group = "launcher"}
    ),
    awful.key(
        {modkey},
        "F3",
        function()
            awful.spawn(apps.music_player)
        end,
        {description = "launch music player", group = "launcher"}
    ),
    -- ALSA volume control
    awful.key(
        {},
        "XF86AudioRaiseVolume",
        function()
            awful.spawn("amixer -D pulse sset Master 5%+ unmute")
            if toggleVolOSD ~= nil then
                toggleVolOSD(true)
            end
            if UpdateVolOSD ~= nil then
                UpdateVolOSD()
            end
        end,
        {description = "volume up", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioLowerVolume",
        function()
            awful.spawn("amixer -D pulse sset Master 5%- unmute")
            if toggleVolOSD ~= nil then
                toggleVolOSD(true)
            end
            if UpdateVolOSD ~= nil then
                UpdateVolOSD()
            end
        end,
        {description = "volume down", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioMute",
        function()
            awful.spawn("amixer -D pulse set Master 1+ toggle")
        end,
        {description = "toggle mute", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioNext",
        function()
            awful.spawn("sp next")
        end,
        {description = "next music", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioPrev",
        function()
            awful.spawn("sp prev")
        end,
        {description = "previous music", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioPlay",
        function()
            awful.spawn("sp play")
        end,
        {description = "play/pause music", group = "hotkeys"}
    ),
    -- Screenshot on prtscn
    awful.key(
        {},
        "Print",
        function()
            awful.util.spawn(apps.screenshot, false)
        end
    ),
    -- Focus client by direction (arrow keys)
    awful.key(
        {modkey},
        "Down",
        function()
            awful.client.focus.bydirection("down")
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus down", group = "client"}
    ),
    awful.key(
        {modkey},
        "Up",
        function()
            awful.client.focus.bydirection("up")
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus up", group = "client"}
    ),
    awful.key(
        {modkey},
        "Left",
        function()
            awful.client.focus.bydirection("left")
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus left", group = "client"}
    ),
    awful.key(
        {modkey},
        "Right",
        function()
            awful.client.focus.bydirection("right")
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "focus right", group = "client"}
    ),
    -- Reload Awesome
    awful.key({modkey, "Shift"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
    -- Quit Awesome
    awful.key(
        {modkey},
        "Escape",
        function()
            awful.spawn(apps.power)
        end,
        {description = "application launcher", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86PowerOff",
        function()
            awful.spawn(apps.power)
        end,
        {description = "toggle exit screen", group = "hotkeys"}
    ),
    -- Lock screen
    awful.key(
        {modkey2},
        "l",
        function()
            awful.spawn(apps.lockscreen)
        end,
        {description = "toggle exit screen", group = "hotkeys"}
    ),
    -- Show help
    awful.key({modkey}, "s", hotkeys_popup.show_help, {description = "show help for awesome", group = "awesome"}),
    -- Gap control
    awful.key(
        {modkey, "Shift"},
        "minus",
        function()
            awful.tag.incgap(5, nil)
        end,
        {description = "increment gaps size for the current tag", group = "gaps"}
    ),
    awful.key(
        {modkey},
        "minus",
        function()
            awful.tag.incgap(-5, nil)
        end,
        {description = "decrement gap size for the current tag", group = "gaps"}
    ),
    -- Number of master clients
    awful.key(
        {modkey, modkey2},
        "Left",
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = "increase the number of master clients", group = "layout"}
    ),
    awful.key(
        {modkey, modkey2},
        "Right",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = "decrease the number of master clients", group = "layout"}
    ),
    -- Number of columns
    awful.key(
        {modkey, modkey2},
        "Up",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = "increase the number of columns", group = "layout"}
    ),
    awful.key(
        {modkey, modkey2},
        "Down",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = "decrease the number of columns", group = "layout"}
    ),
    -- select next layout
    awful.key(
        {modkey},
        "d",
        function()
            awful.layout.inc(1)
        end,
        {description = "select next", group = "layout"}
    ),
    -- select previous layout
    awful.key(
        {modkey, "Shift"},
        "d",
        function()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}
    ),
    -- move client along layout
    awful.key(
        {modkey, "Shift"},
        "Left",
        function()
            awful.client.swap.byidx(-1)
        end,
        {description = "swap with previous client by index", group = "client"}
    ),
    awful.key(
        {modkey, "Shift"},
        "Right",
        function()
            awful.client.swap.byidx(1)
        end,
        {description = "swap with next client by index", group = "client"}
    ),
    -- restore minimized client
    awful.key(
        {modkey, "Shift"},
        "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        {description = "restore minimized", group = "client"}
    )
)

-- Keyboard buttons on specific clients
keys.clientkeys =
    gears.table.join(
    -- toggle fullscreen
    awful.key(
        {modkey},
        "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}
    ),
    -- close client
    awful.key(
        {modkey},
        "q",
        function(c)
            c:kill()
        end,
        {description = "close", group = "client"}
    ),
    -- Minimize
    awful.key(
        {modkey},
        "n",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        {description = "minimize", group = "client"}
    ),
    -- Maximize
    awful.key(
        {modkey},
        "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        {description = "(un)maximize", group = "client"}
    )
)

-- Bind all key numbers to tags
for i = 1, 9 do
    keys.globalkeys =
        gears.table.join(
        keys.globalkeys,
        -- View tag only.
        awful.key(
            {modkey},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #" .. i, group = "tag"}
        ),
        -- Toggle tag display.
        awful.key(
            {modkey, "Control"},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}
        ),
        -- Move client to tag.
        awful.key(
            {modkey, "Shift"},
            "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #" .. i, group = "tag"}
        ),
        -- Toggle tag on focused client.
        awful.key(
            {modkey, "Control", "Shift"},
            "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"}
        )
    )
end

-- Set keys
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

return keys

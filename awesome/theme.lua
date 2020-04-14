local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local theme = {}

theme.base_font = "FiraCode Nerd Font "
theme.font = theme.base_font .. "10"
theme.taglist_font = theme.base_font .. "10"
theme.notification_font = theme.base_font .. "12"

theme.icon_path = awful.util.getdir("config") .. "/icons/"
theme.default_dir = require("awful.util").get_themes_dir() .. "default"

theme.fg_normal = xrdb.foreground
theme.fg_focus = xrdb.color1
theme.fg_urgent = "#CC9393"
theme.taglist_fg_focus = theme.fg_focus
theme.notification_fg = theme.fg_normal

theme.bg_normal = xrdb.background
theme.bg_focus = xrdb.color0
theme.bg_urgent = "#006B8E"
theme.taglist_bg_focus = theme.bg_focus
theme.notification_bg = theme.bg_normal

theme.border_width = dpi(2)
theme.border_normal = xrdb.background
theme.border_focus = xrdb.background
theme.taglist_shape_border_width = dpi(0)
theme.tasklist_shape_border_width = dpi(0)

theme.useless_gap = dpi(8)

theme.notification_border_width = dpi(2)
theme.notification_border_color = theme.fg_normal
theme.notification_margin = dpi(8)
theme.notification_border_width_critical = "#FF0000"

return theme

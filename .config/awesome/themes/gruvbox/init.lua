-- Forest theme --

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.name = "gruvbox"

theme.font = "Iosevka NF 10"

-- Colors
theme.bg_normal = "#1d2021"
theme.fg_normal = "#ebdbb2"

theme.bg_focus = "#1d2021"
theme.fg_focus = "#ebdbb2"

theme.bg_minimize = "#928374"
theme.fg_minimize = "#ebdbb2"

theme.urgent = "#cc241d"

theme.accent = "#458588"

-- System tray
theme.bg_systray = theme.bg_normal

-- Border
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_minimize
theme.border_width = dpi(0)

-- Gaps
theme.useless_gap = dpi(3)

-- Taglist
local taglist_square_size = dpi(4)

theme.taglist_spacing = 0

theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_focus = theme.accent

theme.taglist_bg_normal = theme.bg_normal
theme.taglist_fg_normal = theme.fg_normal

theme.taglist_bg_urgent = theme.bg_normal
theme.taglist_fg_urgent = theme.urgent

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.taglist_fg_focus)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Notifications
theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal

theme.notification_width = 300
theme.notification_height = 75

theme.notification_max_width = 500
theme.notification_max_height = 200

theme.notification_opacity = 1.0

-- Tasklist
theme.tasklist_bg_focus = theme.bg_normal
theme.tasklist_fg_focus = theme.fg_normal

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_fg_normal = theme.fg_normal

theme.tasklist_bg_minimize = theme.bg_minimize
theme.tasklist_fg_minimize = theme.fg_normal

theme.tasklist_bg_urgent = theme.bg_normal
theme.tasklist_fg_urgent = theme.fg_normal

theme.tasklist_spacing = dpi(2)

theme.tasklist_disable_icon = true
theme.tasklist_plain_task_name = true

-- Titlebar
theme.titlebar_minimize_button_normal = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), theme.name)
theme.titlebar_minimize_button_focus = string.format("%s/.config/awesome/themes/%s/titlebar/min.svg", os.getenv("HOME"), theme.name)

theme.titlebar_maximized_button_normal_inactive = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), theme.name)
theme.titlebar_maximized_button_focus_inactive = string.format("%s/.config/awesome/themes/%s/titlebar/max.svg", os.getenv("HOME"), theme.name)

theme.titlebar_maximized_button_normal_active = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), theme.name)
theme.titlebar_maximized_button_focus_active = string.format("%s/.config/awesome/themes/%s/titlebar/max.svg", os.getenv("HOME"), theme.name)

theme.titlebar_close_button_normal = string.format("%s/.config/awesome/themes/%s/titlebar/normal.svg", os.getenv("HOME"), theme.name)
theme.titlebar_close_button_focus = string.format("%s/.config/awesome/themes/%s/titlebar/close.svg", os.getenv("HOME"), theme.name)

-- Wallpaper
theme.wallpaper = string.format("%s/.config/awesome/themes/%s/wallpaper.jpg", os.getenv("HOME"), theme.name)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

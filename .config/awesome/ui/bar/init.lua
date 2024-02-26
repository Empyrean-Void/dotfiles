local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local theme = require("themes.gruvbox")
local power_widget = require("ui.bar.widgets.power")
local battery_widget = require("ui.bar.widgets.battery")
local wifi_widget = require("ui.bar.widgets.wifi")
local date_widget = require("ui.bar.widgets.date")

local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                {raise = true}
            )
        end
    end),
    awful.button({ }, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
    end),
    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
    end))
local function create_wibar(s)
    -- Create a taglist widget
    local mytaglist = awful.widget.taglist({
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
    })

    -- Create a tasklist widget
    local mytasklist = awful.widget.tasklist({
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style = {
            shape_border_width = 2,
            shape_border_color_focus = theme.accent,
            shape_border_color = '#6c6c6c',
            shape_border_color_minimized = theme.bg_minimize,
            shape_border_color_urgent = theme.urgent,

            shape = gears.shape.rounded_bar,
            align = "center",
        },
    })

    -- Create a textclock widget

    -- Create a separator widget (spacer)
    local spacer = wibox.widget.textbox(" ")

    -- Create the wibox
    local mywibox = awful.wibar({
        position = "bottom",
        screen = s,
        width = 1920,
        opacity = 1.0,
        style = {
            shape = gears.shape.rounded_bar,
        }
    })

    -- Add widgets to the wibox
    mywibox:setup({
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spacer,
            power_widget,
            spacer,
            mytaglist,
        },
        mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spacer,
            wifi_widget,
            spacer,
            battery_widget,
            spacer,
            date_widget,
            spacer,
        },
    })
end

-- Export the create_wibar function
return {
    create_wibar = create_wibar
}

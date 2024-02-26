local awful = require('awful')
local watch = require('awful.widget.watch')
local wibox = require('wibox')

local connected = false
local essid = 'N/A'

local function wifi_left_click()
    awful.spawn.easy_async({"bash", "-c", "~/.config/awesome/scripts/wifi-menu.sh"})
end

local widget =
    wibox.widget {
    {
        id = 'icon',
        widget = wibox.widget.textbox,
        font = 'Iosevka Nerd Font 11', -- Set the appropriate font and size here
        align = 'center',
    },
    layout = wibox.layout.align.horizontal,
}

widget:buttons(
    awful.button({}, 1, nil, function() wifi_left_click() end)
)

-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
awful.tooltip(
    {
        objects = {widget},
        mode = 'outside',
        align = 'right',
        timer_function = function()
            if connected then
                return 'Connected to ' .. essid
            else
                return 'Wireless network is disconnected'
            end
        end,
        preferred_positions = {'right', 'left', 'top', 'bottom'},
    }
)

local function updateWidget()
    local widgetIconConnected = "󰖩 " -- Replace with the Nerd Font symbol for connected WiFi
    local widgetIconDisconnected = "󰖪 " -- Replace with the Nerd Font symbol for disconnected WiFi

    local widgetIconName = connected and widgetIconConnected or widgetIconDisconnected
    widget.icon:set_text(widgetIconName)
end

local function grabText()
    if connected then
        awful.spawn.easy_async(
            'nmcli -t -f active,ssid,dev,signal,rate,security,autoconnect,roaming dev wifi list | grep yes | awk -F: \'{print $2":"$3}\'',
            function(stdout)
                local wifi_info = string.match(stdout, '(.+)')
                if wifi_info then
                    essid = wifi_info
                else
                    essid = 'N/A'
                end
            end
        )
    end
end

watch(
    "awk 'NR==3 {printf \"%3.0f\", ($3/70)*100}' /proc/net/wireless",
    5,
    function(_, stdout)
        local wifi_strength = tonumber(stdout)
        if (wifi_strength ~= nil) then
            connected = true
        else
            connected = false
        end

        updateWidget()

        if (connected and (essid == 'N/A' or essid == nil)) then
            grabText()
        end
        collectgarbage('collect')
    end,
    widget
)

-- Initial widget setup
updateWidget()

return widget

theme = require("themes.gruvbox")

local function power_button_left_click()
    awful.spawn.easy_async({"bash", "-c", "~/.config/awesome/scripts/power-menu.sh"}, function(stdout, stderr, exitreason, exitcode)
        -- Handle the result of the script execution here if needed
    end)
end

-- Create the power button widget
local power_button = wibox.widget.textbox('<span color="' .. theme.urgent .. '">⏻</span> ')  -- You can choose a different icon
power_button:buttons(
    awful.button({}, 1, nil, function() power_button_left_click() end)
)

power_button.font = theme.font

return power_button

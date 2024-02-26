awful = require("awful")
wibox = require("wibox")

local function create_titlebar(c)
	awful.titlebar(c):setup({
		{ -- Left
			-- awful.titlebar.widget.iconwidget(c),
			-- buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			awful.titlebar.widget.minimizebutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end

return {
	create_titlebar = create_titlebar
}

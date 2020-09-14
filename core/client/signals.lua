local awful = require("awful")
local beautiful = require("beautiful")
local env = require("core.env")

client.connect_signal("manage",
		      function(c)
			 if awesome.startup and
			    not c.size_hints.user_position
			 and not c.size_hints.program_position then
			    awful.placement.no_offscreen(c)
			 end
		      end
)

client.connect_signal("request::titlebars",
		      function(c)
			 if beautiful.titlebar_fun then
			    beautiful.titlebar_fun(c)
			    return
			 end

			 local buttons = env.my_table.join(
			    awful.button({ }, 1, function()
				  c:emit_signal("request::activate", "titlebar", {raise = true})
				  awful.mouse.client.move(c)
			    end),
			    -- awful.button({ }, 2, function() c:kill() end),
			    awful.button({ }, 3, function()
				  c:emit_signal("request::activate", "titlebar", {raise = true})
				  awful.mouse.client.resize(c)
			    end)
			 )

			 -- awful.titlebar(c, {size = 32, fg_normal = "#606060", fg_focus = "#FFFFFF"})
			 awful.titlebar(c, {size = 5, bg_normal = "#111111", bg_focus = "#80cce6", position = "top"})
			 awful.titlebar(c, {size = 5, bg_normal = "#111111", bg_focus = "#80cce6", position = "right"})
			 awful.titlebar(c, {size = 5, bg_normal = "#111111", bg_focus = "#80cce6", position = "left"})
			 awful.titlebar(c, {size = 5, bg_normal = "#111111", bg_focus = "#80cce6", position = "bottom"})
			 -- : setup {

			 -- { -- Left
			 --    awful.titlebar.widget.stickybutton   (c),
			 --    awful.titlebar.widget.ontopbutton    (c),
			 --    awful.titlebar.widget.floatingbutton (c),
			 --    -- buttons = buttons,
			 --    layout  = wibox.layout.fixed.horizontal
			 -- },
			 -- { -- Middle
			 --    { -- Title
			 --	  align  = "center",
			 --	  widget = awful.titlebar.widget.titlewidget(c)
			 --    },
			 --    buttons = buttons,
			 --    layout  = wibox.layout.flex.horizontal
			 -- },
			 -- { -- Right
			 --    awful.titlebar.widget.minimizebutton(c),
			 --    awful.titlebar.widget.maximizedbutton(c),
			 --    awful.titlebar.widget.closebutton    (c),
			 --    layout = wibox.layout.fixed.horizontal()
			 -- },
			 -- layout = wibox.layout.align.horizontal
			 -- }
		      end
)

client.connect_signal("focus",
		      function(c)
			 if c.my_maximize or c.my_fullscreen then
			    c.border_width = 0
			    c.border_color = beautiful.border_focus
			 else
			    c.border_width = beautiful.border_width
			    c.border_color = beautiful.border_focus
			 end
		      end
)

client.connect_signal("unfocus",
		      function(c)
			 c.border_color = beautiful.border_normal
		      end
)

client.connect_signal("request::manage",
		      function(client, context)
			 if client.floating and context == "new" then
			    client.placement = awful.placement.centered
			 end
		      end
)

client.connect_signal("mouse::enter",
		      function(c)
			 if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
			 and awful.client.focus.filter(c) then
			    client.focus = c
			 end
		      end
)

-- mimic client property immobilized for custom max/fullscreen states
client.connect_signal("property::geometry",
		      function(c)
			 if c.my_fullscreen then
			    local my_screen = c.screen
			    local height = my_screen.geometry.height
			    local width = my_screen.geometry.width
			    local x = my_screen.geometry.x
			    local y = my_screen.geometry.y
			    c:geometry({x = x,
					y = y,
					width = width,
					height = height})
			 end
			 if c.my_maximize then
			    local my_screen = c.screen
			    local height = my_screen.geometry.height
			    local width = my_screen.geometry.width
			    local x = my_screen.geometry.x
			    local y = my_screen.geometry.y
			    c:geometry({x = x,
					y = y + beautiful.wibar_height,
					width = width,
					height = height - beautiful.wibar_height})
			 end
		      end
)

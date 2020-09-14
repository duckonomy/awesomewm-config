local awful	= require("awful")
local env	= require("core.env")
local boat	= require("modules.boat")

return env.my_table.join(
   awful.key({ env.modkey }, "f",
      function(c)
	 boat.toggle_fullscreen(c, false)
      end,
      {description = "toggle fullscreen", group = "client"}),

   awful.key({ env.modkey }, "c",
      function(c)
	 c:kill()
      end,
      {description = "close", group = "client"}),

   awful.key({ env.modkey, "Shift" }, "c",
      function(c)
	 if c.pid then
	    awful.spawn("kill -9 " .. c.pid)
	 end
      end,
      {description = "close", group = "client"}),

   awful.key({ env.modkey, "Control" }, "Return",
      function(c)
	 c:swap(awful.client.getmaster())
      end,
      {description = "move to master", group = "client"}),

   awful.key({ env.modkey, "Shift"}, "m",
      function(c)
	 c:move_to_screen()
      end,
      {description = "move to screen", group = "client"}),

   awful.key({ env.modkey }, "t",
      function(c)
	 c.ontop = not c.ontop
      end,
      {description = "toggle keep on top", group = "client"}),

   awful.key({ env.modkey }, "j",
      function(c)
	 boat.move_direction(c, "down", 20, false)
   end),

   awful.key({ env.modkey }, "k",
      function(c)
	 boat.move_direction(c, "up", 20, false)
   end),

   awful.key({ env.modkey }, "h",
      function(c)
	 boat.move_direction(c, "left", 20, false)
   end),

   awful.key({ env.modkey }, "l",
      function(c)
	 boat.move_direction(c, "right", 20, false)
   end),

   awful.key({ env.modkey, "Shift" }, "j",
      function(c)
	 boat.resize_direction(c, "down", 40, false)
   end),

   awful.key({ env.modkey, "Shift" }, "k",
      function(c)
	 boat.resize_direction(c, "up", 40, false)
   end),

   awful.key({ env.modkey, "Shift" }, "h",
      function(c)
	 boat.resize_direction(c, "left", 40, false)
   end),

   awful.key({ env.modkey, "Shift" }, "l",
      function(c)
	 boat.resize_direction(c, "right", 40, false)
   end),

   awful.key({ env.modkey }, "g",
      function(c)
	 boat.teleport_window(c, "center", false)
   end),

   awful.key({ env.modkey, "Shift" }, "y",
      function(c)
	 boat.teleport_window(c, "left", false)
   end),

   awful.key({ env.modkey, "Shift" }, "o",
      function(c)
	 boat.teleport_window(c, "right", false)
   end),

   awful.key({ env.modkey, "Shift" }, "i",
      function(c)
	 boat.teleport_window(c, "up", false)
   end),

   awful.key({ env.modkey, "Shift" }, "u",
      function(c)
	 boat.teleport_window(c, "down", false)
   end),


   awful.key({ env.modkey }, "i",
      function(c)
	 boat.teleport_window(c, "bottom right", false)
   end),

   awful.key({ env.modkey }, "u",
      function(c)
	 boat.teleport_window(c, "bottom left", false)
   end),

   awful.key({ env.modkey }, "o",
      function(c)
	 boat.teleport_window(c, "top right", false)
   end),

   awful.key({ env.modkey }, "y",
      function(c)
	 boat.teleport_window(c, "top left", false)
   end),

   awful.key({ env.modkey, "Shift" }, "g", awful.placement.centered),

   awful.key({ env.modkey }, "a",
      function(c)
	 boat.toggle_maximize(c, false)
   end)
)

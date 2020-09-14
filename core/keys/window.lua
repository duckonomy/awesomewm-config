-- Keys related to window management
local awful	= require("awful")
local env	= require("core.env")

local window_keys = env.my_table.join(
   awful.key({ env.modkey }, "n",
      function()
	 awful.client.focus.byidx(1)
      end,
      {description = "focus next by index", group = "client"}
   ),

   awful.key({ env.modkey }, "p",
      function()
	 awful.client.focus.byidx(-1)
      end,
      {description = "focus previous by index", group = "client"}
   ),

   awful.key({ env.modkey }, "Tab",
      function()
	 awful.client.focus.byidx(1)
      end,
      {description = "focus next by index", group = "client"}
   ),

   awful.key({ env.modkey, "Shift" }, "Tab",
      function()
	 awful.client.focus.byidx(-1)
      end,
      {description = "focus previous by index", group = "client"}
   ),
   -- Layout manipulation
   awful.key({ env.modkey, "Shift" }, "n",
      function()
	 awful.client.swap.byidx(1)
      end,
      {description = "swap with next client by index", group = "client"}),

   awful.key({ env.modkey, "Shift" }, "p",
      function()
	 awful.client.swap.byidx(-1)
      end,
      {description = "swap with previous client by index", group = "client"}),

   awful.key({ env.modkey }, "m",
      function()
	 awful.screen.focus_relative(1)
      end,
      {description = "focus the next screen", group = "screen"}),

   awful.key({ env.modkey, env.altkey }, "m",
      function()
	 awful.screen.focus_relative(-1)
      end,
      {description = "focus the previous screen", group = "screen"}),

   awful.key({ env.modkey }, "F1",
      awful.client.urgent.jumpto,
      {description = "jump to urgent client", group = "client"}),

   awful.key({ env.modkey, "Control" }, "n",
      function()
	 local c = awful.client.restore()
	 -- Focus restored client
	 if c then
	    client.focus = c
	    c:raise()
	 end
      end,
      {description = "restore minimized", group = "client"})
)

return window_keys

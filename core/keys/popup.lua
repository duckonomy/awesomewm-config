-- Keys related to popups
local awful	= require("awful")
local env	= require("core.env")

local popup_keys = env.my_table.join(
   awful.key({ env.modkey, env.altkey }, "F9",
      function()
	 if beautiful.fs then
	    beautiful.fs.show(7)
	 end
      end,
      {description = "show filesystem", group = "widgets"}),

   awful.key({ env.modkey }, "F9",
      function()
	 if beautiful.weather then
	    beautiful.weather.show(7)
	 end
      end,
      {description = "show weather", group = "widgets"})
)

return popup_keys

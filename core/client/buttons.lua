local awful	= require("awful")
local env	= require("core.env")

return env.my_table.join(
   awful.button({ }, 1,
      function(c)
	 c:emit_signal("request::activate", "mouse_click", {raise = true})
      end
   ),

   awful.button({ env.modkey }, 1,
      function(c)
	 c:emit_signal("request::activate", "mouse_click", {raise = true})
	 awful.mouse.client.move(c)
      end
   ),

   awful.button({ env.modkey }, 3,
      function(c)
	 c:emit_signal("request::activate", "mouse_click", {raise = true})
	 awful.mouse.client.resize(c)
      end
   )
)

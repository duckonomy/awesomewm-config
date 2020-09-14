local awful	= require("awful")
local env	= require("core.env")

local menu_keys = env.my_table.join(
   awful.button({ }, 3,
      function()
	 awful.util.mymainmenu:toggle()
      end
   )
)

return menu_keys

local awful	= require("awful")
local env	= require("core.env")

local tag_keys = env.my_table.join(
   awful.button({ }, 5,
      awful.tag.viewnext),

   awful.button({ }, 4,
      awful.tag.viewprev)
)

return tag_keys

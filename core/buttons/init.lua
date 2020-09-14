local tags = require("core.buttons.tags")
local menu = require("core.buttons.menu")
local env  = require("core.env")

return env.my_table.join(
   tags,
   menu
)

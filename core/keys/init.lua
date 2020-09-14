local bar =	 require("core.keys.bar")
local apps =	 require("core.keys.apps")
local launcher = require("core.keys.launcher")
local media =	 require("core.keys.media")
local system =	 require("core.keys.system")
local popup =	 require("core.keys.popup")
local window =	 require("core.keys.window")
local env =	 require("core.env")

return env.my_table.join(
   bar,
   apps,
   launcher,
   media,
   system,
   popup,
   window
)

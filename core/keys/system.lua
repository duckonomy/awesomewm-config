-- Keys related to system
local awful	= require("awful")
local env	= require("core.env")

local system_keys = env.my_table.join(
   awful.key({ env.modkey, env.altkey }, "=",
      function()
	 awful.spawn("reboot")
      end,
      {description = "run browser", group = "launcher"}),

   awful.key({ env.modkey, env.altkey }, "-",
      function()
	 awful.spawn("poweroff")
      end,
      {description = "run browser", group = "launcher"}),

   awful.key({ env.modkey }, "F7",
      awesome.restart,
      {description = "reload awesome", group = "awesome"}),

   awful.key({ env.modkey, "Shift" }, "Escape",
      awesome.quit,
      {description = "quit awesome", group = "awesome"}),

   awful.key({ env.modkey, env.altkey }, "c",
      function()
	 awful.spawn.with_shell("xsel | xsel -i -b")
      end,
      {description = "copy terminal to gtk", group = "hotkeys"}),

   awful.key({ env.modkey, env.altkey }, "v",
      function()
	 awful.spawn.with_shell("xsel -b | xsel")
      end,
      {description = "copy gtk to terminal", group = "hotkeys"})
)

return system_keys

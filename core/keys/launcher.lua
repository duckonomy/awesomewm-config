-- Keys related to laucher
local awful	= require("awful")
local env	= require("core.env")

local launcher_keys = env.my_table.join(
   awful.key({ env.modkey }, "r",
      function()
	 awful.screen.focused().mypromptbox:run()
      end,
      {description = "run prompt", group = "launcher"}),

   awful.key({ env.modkey }, "s",
      function()
	 awful.spawn(env.rofi)
      end,
      {description = "run rofi", group = "launcher"}),

   awful.key({ env.modkey, "Shift" }, "s",
      function()
	 awful.spawn.with_shell(env.rofi_monitor_layout)
      end,
      {description = "run monitor", group = "launcher"}),

   awful.key({ env.modkey }, "F5",
      function()
	 awful.spawn.with_shell(env.rofi_calc)
      end,
      {description = "run calc", group = "launcher"}),

   awful.key({ env.modkey, "Shift" }, "F5",
      function()
	 awful.spawn.with_shell(env.guicalc)
      end,
      {description = "run calculator", group = "launcher"}),

   awful.key({ env.modkey, "Shift" }, "r",
      function()
	 awful.prompt.run {
	    prompt       = "Run Lua code: ",
	    textbox      = awful.screen.focused().mypromptbox.widget,
	    exe_callback = awful.util.eval,
	    history_path = awful.util.get_cache_dir() .. "/history_eval"
	 }
      end,
      {description = "lua execute prompt", group = "awesome"}),

   awful.key({ env.modkey }, "F12",
      function()
	 awful.spawn("networkmanager_dmenu")
      end,
      {description = "networkmanager", group = "hotkeys"}),

   awful.key({ env.modkey }, "F12",
      function()
	 awful.spawn("networkmanager_dmenu")
      end,
      {description = "networkmanager", group = "hotkeys"}),

   awful.key({ env.modkey }, "F11",
      function()
	 awful.spawn.with_shell("$HOME/.bin/pkgs/passmenu")
      end,
      {description = "passwords", group = "hotkeys"}),

   awful.key({ env.modkey }, "F10",
      function()
	 awful.spawn("restartemacs")
      end,
      {description = "restart emacs", group = "hotkeys"})

   -- awful.key({ env.modkey          }, "m",
   --    function()
   --	 awful.spawn.with_shell(rofi_clip)
   --    end,
   --    {description = "run clip", group = "launcher"}),
)

return launcher_keys

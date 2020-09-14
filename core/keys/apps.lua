-- Keys related to applications
local awful	= require("awful")
local env	= require("core.env")

local app_keys = env.my_table.join(
   awful.key({ }, "Print",
      function()
	 awful.spawn.with_shell("$HOME/.bin/screenshot")
      end,
      {description = "take a screenshot", group = "hotkeys"}),

   awful.key({ env.modkey }, "F4",
      function()
	 awful.spawn.with_shell(env.scrlocker)
      end,
      {description = "lock screen", group = "hotkeys"}),

   awful.key({ env.modkey }, "Return",
      function()
	 awful.spawn(env.terminal)
      end,
      {description = "open a terminal", group = "launcher"}),

   awful.key({ env.modkey }, "w",
      function()
	 awful.spawn(env.browser)
      end,
      {description = "run browser", group = "launcher"}),

   awful.key({ env.modkey }, "e",
      function()
	 awful.spawn(env.guieditorc)
      end,
      {description = "run emacsclient", group = "launcher"}),

   awful.key({ env.modkey, "Shift" }, "e",
      function()
	 awful.spawn(env.guieditor)
      end,
      {description = "run emacs", group = "launcher"}),

   awful.key({ env.modkey, "Shift" }, "d",
      function()
	 awful.spawn(env.guifileman)
      end,
      {description = "run filemanager", group = "launcher"}),

   awful.key({ env.modkey }, "d",
      function()
	 awful.spawn(env.guieditor)
      end,
      {description = "run nnn", group = "launcher"}),

   awful.key({ env.modkey }, ";",
      function()
	 awful.spawn(env.ncmpcpp)
      end,
      {description = "run ncmpcpp", group = "launcher"}),

   awful.key({ env.modkey }, "x",
      function()
	 awful.spawn(env.weechat)
      end,
      {description = "run weechat", group = "launcher"})
)

return app_keys

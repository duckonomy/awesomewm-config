-- Keys related to media settings
local awful	= require("awful")
local env	= require("core.env")
local beautiful = require("beautiful")

local media_keys = env.my_table.join(
      -- ALSA volume control
      awful.key({ env.modkey }, "0",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/volume/up")
	    beautiful.volume.update()
	 end,
	 {description = "volume up", group = "hotkeys"}),

      awful.key({ env.modkey }, "9",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/volume/down")
	    beautiful.volume.update()
	 end,
	 {description = "volume down", group = "hotkeys"}),

      awful.key({ env.modkey }, "8",
	 function()
	    os.execute("amixer set Master toggle")
	    beautiful.volume.update()
	 end,
	 {description = "toggle mute", group = "hotkeys"}),

      awful.key({ }, "XF86AudioRaiseVolume",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/volume/up")
	    beautiful.volume.notify()
	 end,
	 {description = "volume up", group = "hotkeys"}),

      awful.key({ }, "XF86AudioLowerVolume",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/volume/down")
	    beautiful.volume.notify()
	 end,
	 {description = "volume down", group = "hotkeys"}),

      awful.key({ }, "XF86AudioMute",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/volume/mute")
	    beautiful.volume.notify()
	 end,
	 {description = "toggle mute", group = "hotkeys"}),

      awful.key({ }, "XF86MonBrightnessUp",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/brightness-change up")
	 end,
	 {description = "+10%", group = "hotkeys"}),

      awful.key({ }, "XF86MonBrightnessDown",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/brightness-change down")
	 end,
	 {description = "-10%", group = "hotkeys"}),

      awful.key({ env.modkey }, "=",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/brightness-change up")
	 end,
	 {description = "+10%", group = "hotkeys"}),

      awful.key({ env.modkey }, "-",
	 function()
	    awful.spawn.with_shell("$HOME/.bin/brightness-change down")
	 end,
	 {description = "-10%", group = "hotkeys"}),

      awful.key({ env.modkey }, "/",
	 function()
	    awful.spawn("mpc toggle")
	    beautiful.mpd.update()
	 end,
	 {description = "mpc toggle", group = "widgets"}),

      awful.key({ env.modkey }, "'",
	 function()
	    awful.spawn("mpc stop")
	    beautiful.mpd.update()
	 end,
	 {description = "mpc stop", group = "widgets"}),

      awful.key({ env.modkey }, ",",
	 function()
	    awful.spawn("mpc prev")
	    beautiful.mpd.update()
	 end,
	 {description = "mpc prev", group = "widgets"}),

      awful.key({ env.modkey }, ".",
	 function()
	    awful.spawn("mpc next")
	    beautiful.mpd.update()
	 end,
	 {description = "mpc next", group = "widgets"})
)

return media_keys

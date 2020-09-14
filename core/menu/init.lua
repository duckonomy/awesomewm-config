-- Menu
local awful		= require("awful")
local beautiful		= require("beautiful")
local freedesktop	= require("freedesktop")
local env		= require("core.env")

local myawesomemenu = {
   -- { "hotkeys", function() return false, hotkeys_popup.show_help end },
   { "manual", env.terminal .. " -e man awesome" },
   { "edit config", string.format("%s %s", env.guieditorc, awesome.conffile) },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end }
}

awful.util.mymainmenu = freedesktop.menu.build({
      icon_size = beautiful.menu_height or 32,
      before = {
	 { "Awesome", myawesomemenu, beautiful.awesome_icon },
      },
      after = {
	 { "Open terminal", terminal },
      }
})

return init

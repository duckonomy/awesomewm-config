local wibox	= require("wibox")
local beautiful = require("beautiful")
local awful	= require("awful")

awful.screen.connect_for_each_screen(
   function(s)
  s.systray = wibox.widget.systray()
  s.systray.visible = false
  beautiful.at_screen_connect(s)
   end
)

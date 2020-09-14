local beautiful = require("beautiful")
local awful	= require("awful")
local gears	= require("gears")

screen.connect_signal("property::geometry",
 		 function(s)
 		    if beautiful.wallpaper then
 		       local wallpaper = beautiful.wallpaper
 		       if type(wallpaper) == "function" then
 			  wallpaper = wallpaper(s)
 		       end
 		       gears.wallpaper.tiled(wallpaper, s)
 		    end
 		 end
)

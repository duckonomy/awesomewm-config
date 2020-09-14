-- Boat is an awesome module for handling floating windows.
-- This library assumes that you've handled tiling operations.
-- So, this only works on floating windows.
-- TODO: Get rid of tiling stuff & figure out how to get variables

local awful		= require("awful")
local naughty		= require("naughty")

local boat = {}

-- TODO Get this value from beautiful.border_width
-- boat.border_width = 5

function boat.fullscreen_off(c)
   if c.my_fullscreen == nil or c.my_fullscreen == true then
      c.my_fullscreen = false;
      awful.titlebar.show(c, "top")
      awful.titlebar.show(c, "bottom")
      awful.titlebar.show(c, "right")
      awful.titlebar.show(c, "left")
      if c.previous_fullscreen_x ~= nil and
	 c.previous_fullscreen_y ~= nil and
	 c.previous_fullscreen_width ~= nil and
	 c.previous_fullscreen_height ~= nil
      then
	 c:geometry({x = c.previous_fullscreen_x,
		     y = c.previous_fullscreen_y,
		     width = c.previous_fullscreen_width,
		     height = c.previous_fullscreen_height})
      end
      if boat.border_width == nil then
	 naughty.notify({ preset = naughty.config.presets.warn,
			  title = "Warning!",
			  text = "boat.border_width not set!" })
      else
	 c.border_width = boat.border_width
      end
      -- Apparently this is a read-only property
      -- c.immobilized = false
   end
end

function boat.fullscreen_on(c)
   if c.my_fullscreen == nil or c.my_fullscreen == false then
      c.my_fullscreen = true;
      c.previous_fullscreen_x = c:geometry().x
      c.previous_fullscreen_y = c:geometry().y
      c.previous_fullscreen_height = c:geometry().height
      c.previous_fullscreen_width = c:geometry().width
      local my_screen = awful.screen.focused()
      local height = my_screen.geometry.height
      local width = my_screen.geometry.width
      local x = my_screen.geometry.x
      local y = my_screen.geometry.y
      c:geometry({x = x,
		  y = y,
		  width = width,
		  height = height})
      c.border_width = 0
      awful.titlebar.hide(c, "top")
      awful.titlebar.hide(c, "bottom")
      awful.titlebar.hide(c, "right")
      awful.titlebar.hide(c, "left")
      -- Apparently this is a read-only property
      -- c.immobilized = true
   end
end

function boat.maximize_off(c)
   if c.my_maximize == nil or c.my_maximize == true then
      c.my_maximize = false;
      awful.titlebar.show(c, "top")
      awful.titlebar.show(c, "bottom")
      awful.titlebar.show(c, "right")
      awful.titlebar.show(c, "left")
      if c.previous_maximize_x ~= nil and
	 c.previous_maximize_y ~= nil and
	 c.previous_maximize_width ~= nil and
	 c.previous_maximize_height ~= nil
      then
	 c:geometry({x = c.previous_maximize_x,
		     y = c.previous_maximize_y,
		     width = c.previous_maximize_width,
		     height = c.previous_maximize_height})
      end
      if boat.border_width == nil then
	 naughty.notify({ preset = naughty.config.presets.warn,
			  title = "Warning!",
			  text = "boat.border_width not set!" })
      else
	 c.border_width = boat.border_width
      end
      -- Apparently this is a read-only property
      -- c.immobilized = false
   end
end

function boat.maximize_on(c)
   if c.my_maximize == nil or c.my_maximize == false then
      c.my_maximize = true;
      c.previous_maximize_x = c:geometry().x
      c.previous_maximize_y = c:geometry().y
      c.previous_maximize_height = c:geometry().height
      c.previous_maximize_width = c:geometry().width
      local my_screen = awful.screen.focused()
      local height = my_screen.geometry.height
      local width = my_screen.geometry.width
      local x = my_screen.geometry.x
      local y = my_screen.geometry.y
      c:geometry({x = x,
		  y = y + 32,
		  width = width,
		  height = height - 32}) -- TODO change this to actual bar height
      c.border_width = 0
      awful.titlebar.hide(c, "top")
      awful.titlebar.hide(c, "bottom")
      awful.titlebar.hide(c, "right")
      awful.titlebar.hide(c, "left")
      -- Apparently this is a read-only property
      -- c.immobilized = true
   end
end

function boat.toggle_fullscreen(c, ewmh_notify)
   if ewmh_notify then
      c.maximized = false
   else
      boat.maximize_off(c)
   end

   if (ewmh_notify) then
      c.fullscreen = not c.fullscreen
   else
      if (c.my_fullscreen) then
	 boat.fullscreen_off(c)
      else
	 boat.fullscreen_on(c)
      end
   end
   c:raise()
end

function boat.toggle_maximize(c, ewmh_notify)
   if ewmh_notify then
      c.fullscreen = false
   else
      boat.fullscreen_off(c)
   end

   if c.floating == true then
      if (ewmh_notify) then
	 c.maximized = not c.maximized
      else
	 if (c.my_maximize) then
	    boat.maximize_off(c)
	 else
	    boat.maximize_on(c)
	 end

      end
   else
      awful.layout.inc(1)
   end
end

function boat.move_direction(c, direction, amount, emwh_notify)
   if ewmh_notify then
      c.maximized = false
      c.fullscreen = false
   else
      boat.maximize_off(c)
      boat.fullscreen_off(c)
   end
   if c.floating then
      boat.move_direction_direct(c, direction, amount, emwh_notify)
   else
      boat.focus_direction_tile(c, direction, ewmh_notify)
   end
end

function boat.focus_direction_tile(c, direction, ewmh_notify)
   awful.client.focus.global_bydirection(direction)
   if client.focus then
      client.focus:raise()
   end
end

function boat.move_direction_direct(c, direction, amount, emwh_notify)
   if direction == "left" then
      c:relative_move(-amount, 0, 0, 0)
   elseif direction == "right" then
      c:relative_move(amount, 0, 0, 0)
   elseif direction == "up" then
      c:relative_move(0, -amount, 0, 0)
   elseif direction == "down" then
      c:relative_move(0, amount, 0, 0)
   else
      naughty.notify({ preset = naughty.config.presets.warn,
		       title = "Warning!",
		       text = "No such direction in boat.lua: move_direction_direct()." })
   end
end


function boat.teleport_window(c, direction, emwh_notify)
   if ewmh_notify then
      c.maximized = false
      c.fullscreen = false
   else
      boat.maximize_off(c)
      boat.fullscreen_off(c)
   end
   if c.floating then
      boat.teleport_window_direct(c, direction, emwh_notify)
   else
      boat.focus_direction_tile(c, direction, ewmh_notify)
   end
end

function boat.resize_direction(c, direction, amount, emwh_notify)
   if ewmh_notify then
      c.maximized = false
      c.fullscreen = false
   else
      boat.maximize_off(c)
      boat.fullscreen_off(c)
   end
   if c.floating then
      boat.resize_direction_direct(c, direction, amount, emwh_notify)
   else
      boat.resize_direction_tile(c, direction, ewmh_notify)
   end
end

function boat.resize_direction_direct(c, direction, amount, emwh_notify)
   -- 40
   if direction == "left" then
      c:relative_move( 0,  0, -amount, 0)
   elseif direction == "right" then
      c:relative_move( 0, 0, amount, 0)
   elseif direction == "up" then
      c:relative_move( 0, 0, 0, -amount)
   elseif direction == "down" then
      c:relative_move( 0, 0, 0, amount)
   else
      naughty.notify({ preset = naughty.config.presets.warn,
		       title = "Warning!",
		       text = "No such direction in boat.lua: resize_direction_direct()." })
   end
end

function boat.resize_direction_tile(c, direction, emwh_notify)
   -- 40
   if direction == "left" then
      awful.tag.incmwfact(-0.01)
   elseif direction == "right" then
      awful.tag.incmwfact( 0.01)
   elseif direction == "up" then
      awful.client.incwfact(-0.01)
   elseif direction == "down" then
      awful.client.incwfact(0.01)
   else
      naughty.notify({ preset = naughty.config.presets.warn,
		       title = "Warning!",
		       text = "No such direction in boat.lua: resize_direction_tile()." })
   end
end

function boat.increase_direction_tile(c, direction, ewmh_notify)
   if direction == "top left" then
      awful.tag.incnmaster(-1, nil, true)
   elseif direction == "top right" then
      awful.tag.incnmaster( 1, nil, true)
   elseif direction == "bottom left" then
      awful.tag.incncol(-1, nil, true)
   elseif direction == "bottom right" then
      awful.tag.incncol( 1, nil, true)
   else
      naughty.notify({ preset = naughty.config.presets.warn,
		       title = "Warning!",
		       text = "No such direction in boat.lua: increase_direction_tile()." })
   end
end

function boat.teleport_window_direct(c, direction, emwh_notify)
   if direction == "top left" then
      local f = awful.placement.scale + awful.placement.top_left
      local geo = f(client.focus, {honor_workarea = true, to_percent = 0.5})
   elseif direction == "top right" then
      local f = awful.placement.scale + awful.placement.top_right
      local geo = f(client.focus, {honor_workarea = true, to_percent = 0.5})
   elseif direction == "bottom left" then
      local f = awful.placement.scale + awful.placement.bottom_left
      local geo = f(client.focus, {honor_workarea = true, to_percent = 0.5})
   elseif direction == "bottom right" then
      local f = awful.placement.scale + awful.placement.bottom_right
      local geo = f(client.focus, {honor_workarea = true, to_percent = 0.5})
   elseif direction == "left" then
      local axis = 'vertically'
      local f = awful.placement.scale
	 + awful.placement.left
	 + (axis and awful.placement['maximize_'..axis] or nil)
      local geo = f(client.focus, {honor_workarea=true, to_percent = 0.5})
   elseif direction == "right" then
      local axis = 'vertically'
      local f = awful.placement.scale
	 + awful.placement.right
	 + (axis and awful.placement['maximize_'..axis] or nil)
      local geo = f(client.focus, {honor_workarea=true, to_percent = 0.5})
   elseif direction == "up" then
      local axis = 'horizontally'
      local f = awful.placement.scale
	 + awful.placement.top
	 + (axis and awful.placement['maximize_'..axis] or nil)
      local geo = f(client.focus, {honor_workarea=true, to_percent = 0.5})
   elseif direction == "down" then
      local axis = 'horizontally'
      local f = awful.placement.scale
	 + awful.placement.bottom
	 + (axis and awful.placement['maximize_'..axis] or nil)
      local geo = f(client.focus, {honor_workarea=true, to_percent = 0.5})
   elseif direction == "center" then
      local f = awful.placement.scale + awful.placement.centered
      local geo = f(client.focus, {honor_workarea=true, to_percent = 0.5})
   else
      naughty.notify({ preset = naughty.config.presets.warn,
		       title = "Warning!",
		       text = "No such direction in boat.lua: teleport_window_direct()." })
   end
end

return boat

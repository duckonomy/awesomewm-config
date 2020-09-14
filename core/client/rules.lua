local awful	= require("awful")
local beautiful = require("beautiful")
local env	= require("core.env")
local keys	= require("core.client.keys")
local buttons	= require("core.client.buttons")

awful.rules.rules = {
   -- All clients will match this rule.
   { rule = { },
     properties = { border_width = beautiful.border_width,
		    border_color = beautiful.border_normal,
		    focus = awful.client.focus.filter,
		    raise = true,
		    keys = keys,
		    buttons = buttons,
		    screen = awful.screen.preferred,
		    floating = true,
		    placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		    size_hints_honor = false
     }
   },


   -- Titlebars
   { rule_any = { type = { "normal" } },
     properties = { titlebars_enabled = true } },

   { rule_any = { type = { "splash", "dialog" } },
     properties = { titlebars_enabled = false } },

   -- Spawn floating clients centered
   { rule_any = { type =  { "normal" }},
     properties = {
	placement = awful.placement.centered
     }
   },
}

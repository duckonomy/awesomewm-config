-- Keys related to bar (including tags and tasklists)
local awful	= require("awful")
local env	= require("core.env")
local gnat	= require("modules.gnat")

local bar_keys = env.my_table.join(
   awful.key({ env.modkey }, "\\",
      function()
	 awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
      end,
      {description = "Toggle systray visibility", group = "custom"}),

   awful.key({ env.modkey }, "[",
      awful.tag.viewprev,
      {description = "view previous", group = "tag"}),

   awful.key({ env.modkey }, "]",
      awful.tag.viewnext,
      {description = "view next", group = "tag"}),

   awful.key({ env.modkey, "Shift" }, "\\",
      awful.tag.history.restore,
      {description = "go back", group = "tag"}),
   -- Non-empty tag browsing
   awful.key({ env.modkey, "Shift" }, "[",
      gnat.to_prev_workspace,
      {description = "move client to previous tag", group = "tag"}),

   awful.key({ env.modkey, "Shift" }, "]",
      gnat.to_next_workspace,
      {description = "move client to next tag", group = "layout"}),
   awful.key({ env.modkey }, "b",
      function()
	 for s in screen do
	    s.mywibox.visible = not s.mywibox.visible
	    if s.mybottomwibox then
	       s.mybottomwibox.visible = not s.mybottomwibox.visible
	    end
	 end
      end,
      {description = "toggle wibox", group = "awesome"})
)

for i = 1, 7 do
   -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
   local descr_view, descr_toggle, descr_move, descr_toggle_focus
   if i == 1 or i == 7 then
      descr_view = {description = "view tag #", group = "tag"}
      descr_toggle = {description = "toggle tag #", group = "tag"}
      descr_move = {description = "move focused client to tag #", group = "tag"}
      descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
   end
   bar_keys = env.my_table.join(bar_keys,
				-- View tag only.
				awful.key({ env.modkey }, "#" .. i + 9,
				   function()
				      local screen = awful.screen.focused()
				      local tag = screen.tags[i]
				      if tag then
					 tag:view_only()
				      end
				   end,
				   descr_view),
				-- Toggle tag display.
				awful.key({ env.modkey, "Control" }, "#" .. i + 9,
				   function()
				      local screen = awful.screen.focused()
				      local tag = screen.tags[i]
				      if tag then
					 awful.tag.viewtoggle(tag)
				      end
				   end,
				   descr_toggle),
				-- Move client to tag.
				awful.key({ env.modkey, "Shift" }, "#" .. i + 9,
				   function()
				      if client.focus then
					 local tag = client.focus.screen.tags[i]
					 if tag then
					    client.focus:move_to_tag(tag)
					 end
				      end
				   end,
				   descr_move),
				-- Toggle tag on focused client.
				awful.key({ env.modkey, "Control", "Shift" }, "#" .. i + 9,
				   function()
				      if client.focus then
					 local tag = client.focus.screen.tags[i]
					 if tag then
					    client.focus:toggle_tag(tag)
					 end
				      end
				   end,
				   descr_toggle_focus)
   )
end

return bar_keys

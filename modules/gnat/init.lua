-- Some tagging helper functions

gnat = {}

function gnat.to_next_workspace()
   local t = client.focus and client.focus.first_tag or nil
   if t == nil then
      return
   end
   local tag = client.focus.screen.tags[(t.index % 9) + 1]
   client.focus:move_to_tag(tag)
end

function gnat.to_prev_workspace()
   local t = client.focus and client.focus.first_tag or nil
   if t == nil then
      return
   end
   local tag = client.focus.screen.tags[(t.index - 2) % 5 + 1]
   client.focus:move_to_tag(tag)
end

return gnat

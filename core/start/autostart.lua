local awful = require("awful")

local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
	awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({
      "unclutter -root",
      "parcellite -n",
      "nimf",
      "udiskie",
      "mpd",
      "blueman-applet",
      "nm-applet",
      "picom",
      -- "autocutsel -fork",
      -- "/usr/lib/geoclue-2.0/demos/agent",
      -- "redshift-gtk",
})

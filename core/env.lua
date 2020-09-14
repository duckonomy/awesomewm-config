local awful = require("awful")
local gears = require("gears")

local env = {
   modkey		= "Mod4",
   altkey		= "Mod1",
   terminal		= "termite",
   editor		= os.getenv("EDITOR") or "vim",
   browser		= "firefoxexec",
   guieditorc		= "emacsclient -c",
   guieditor		= "emacs",
   guifileman		= "pcmanfm",
   -- taskman		= terminal .. " -e tmux",
   -- fileman		= terminal .. " -e nnn",
   -- ncmpcpp		= terminal .. " -e ncmpcpp",
   -- weechat		= terminal .. " -e weechat",
   dmenu		= "$HOME/.bin/launch/dmenu-launch",
   rofi			= "rofi -show run",
   rofi_monitor_layout	= "$HOME/.bin/rofi/monitor_layout",
   rofi_clip		= "$HOME/.bin/rofi/clip",
   rofi_calc		= "$HOME/.bin/rofi/calcthis",
   guicalc		= "qalculate-gtk",
   scrlocker		= "$HOME/.bin/lock",
   my_table		= awful.util.table or gears.table
}


awful.util.terminal = env.terminal

return env

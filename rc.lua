-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

require("awful.autofocus")

local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")

require("core.start.load_notify")
require("core.start.autostart")
require("core.tags")

require("core.start.load_theme")

require("core.menu")

require("core.screen.wallpaper")
require("core.screen.bar")

root.buttons(require("core.buttons"))
root.keys(require("core.keys"))

require("core.client")

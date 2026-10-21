local browser = "librewolf"
local files = "nautilus"
local launcher = "fuzzel"
local mod = "SUPER"
local terminal = "foot"

hl.bind(mod .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + D",      hl.dsp.exec_cmd("discord"))
hl.bind(mod .. " + F",      hl.dsp.exec_cmd(files))
hl.bind(mod .. " + L",      hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. " + Q",      hl.dsp.window.close())
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + SPACE",  hl.dsp.exec_cmd(launcher))
hl.bind(mod .. " + V",      hl.dsp.window.float({ action = "toggle" }))

hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill waybar || waybar"))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker --autocopy"))
hl.bind(mod .. " + SHIFT + Q", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill swaybg || swaybg --image ~/.wallpaper"))

hl.bind(mod .. " + ampersand",  hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + eacute",     hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + quotedbl",   hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + apostrophe", hl.dsp.focus({ workspace = 4 }))

hl.bind(mod .. " + SHIFT + ampersand",  hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + SHIFT + eacute",     hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + SHIFT + quotedbl",   hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + SHIFT + apostrophe", hl.dsp.window.move({ workspace = 4 }))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot --mode region --output-folder ~/Pictures/Screenshots"))

hl.bind("SHIFT + XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute             @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume --limit 1 @DEFAULT_AUDIO_SOURCE@ 5%-"))
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume --limit 1 @DEFAULT_AUDIO_SOURCE@ 5%+"))
hl.bind("XF86AudioMute",                hl.dsp.exec_cmd("wpctl set-mute             @DEFAULT_AUDIO_SINK@   toggle"))
hl.bind("XF86AudioLowerVolume",         hl.dsp.exec_cmd("wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@   5%-"))
hl.bind("XF86AudioRaiseVolume",         hl.dsp.exec_cmd("wpctl set-volume --limit 1 @DEFAULT_AUDIO_SINK@   5%+"))

hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1-"))
hl.bind("SHIFT + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 1+"))
hl.bind("XF86MonBrightnessDown",         hl.dsp.exec_cmd("brightnessctl set 1%-"))
hl.bind("XF86MonBrightnessUp",           hl.dsp.exec_cmd("brightnessctl set 1%+"))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())

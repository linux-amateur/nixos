local speedAll = 10
local springAll = "spring1"

hl.curve( "spring1", { type = "spring", mass = 1, stiffness = 30, dampening = 10, })

hl.animation({ enabled = false, leaf = "fade", })
hl.animation({ enabled = false, leaf = "layers", })
hl.animation({ enabled = true,  leaf = "windows",    speed = speedAll, spring = springAll, style = "gnomed", })
hl.animation({ enabled = true,  leaf = "workspaces", speed = speedAll, spring = springAll, style = "slide", })

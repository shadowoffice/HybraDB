-- Information about the script goes here

name = "Resurrector"
description = "Death NPC"
author = "Justin Baugh <baughj@hybrasyl.com>"

function OnClick()
  invoker.SystemMessage("Death is but a door. Time is but a window.")
  invoker.SystemMessage(name .. " casts resurrection on you.")
  invoker.Resurrect()
end

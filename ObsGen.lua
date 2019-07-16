dropSide = 1 --сброс обсидиана 0 = низ; 1 = верх;
local r = require("component").robot
local tc = require("compon﻿ent").tank_controller
local slots = r.inventorySize()

local function drop()
  for i=2, slots do
    if r.count(i) > 0 then
      r.select(i)
      r.drop(dropSide)
    end
  end
  r.select(1)
end

while tc.drain() do
  r.fill(3)
  r.swing(3)
  if r.count(slots) > 0 then
    drop()
  end﻿
end
drop()

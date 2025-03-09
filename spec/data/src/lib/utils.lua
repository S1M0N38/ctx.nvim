-----------------------------------------
-- lib/utils.lua
-----------------------------------------
local utils = {}

function utils.isEmpty(t)
  return next(t) == nil
end

function utils.merge(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

function utils.clone(t)
  local copy = {}
  for k, v in pairs(t) do
    copy[k] = v
  end
  return copy
end

return utils

-----------------------------------------
-- lib/core/events.lua
-----------------------------------------
local events = {}
local handlers = {}

function events.on(event, handler)
  if not handlers[event] then
    handlers[event] = {}
  end

  table.insert(handlers[event], handler)
end

function events.trigger(event, data)
  if not handlers[event] then
    return false
  end

  for _, handler in ipairs(handlers[event]) do
    handler(data)
  end

  return true
end

return events

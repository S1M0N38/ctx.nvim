```lua spec/data/src/lib/core/engine.lua
-----------------------------------------
-- lib/core/engine.lua
-----------------------------------------
local engine = {}
local initialized = false

function engine.initialize(settings)
  if initialized then
    return false
  end

  -- Mock initialization logic
  initialized = true
  engine.settings = settings

  return true
end

function engine.isInitialized()
  return initialized
end

function engine.process(data)
  if not initialized then
    return nil, "Engine not initialized"
  end

  -- Mock processing
  return {
    processed = true,
    result = "Processed: " .. tostring(data),
  }
end

return engine
```

```lua spec/data/src/lib/core/events.lua
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
```

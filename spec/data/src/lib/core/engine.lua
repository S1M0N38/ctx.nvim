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

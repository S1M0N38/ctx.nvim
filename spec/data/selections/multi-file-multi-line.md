```lua ctx.nvim/spec/data/src/modules/users.lua:23-28
function users.loadAll()
  -- Mock data
  users.create("John", "john@example.com")
  users.create("Alice", "alice@example.com")
  return userList
end
```

```lua ctx.nvim/spec/data/src/main.lua:9-21
local function main()
  logger.log("Application starting")

  if config.debug then
    logger.log("Debug mode enabled")
  end

  engine.initialize(config.settings)
  users.loadAll()

  logger.log("Application ready")
  return true
end
```

```lua ctx.nvim/spec/data/src/lib/core/engine.lua:7-17
function engine.initialize(settings)
  if initialized then
    return false
  end

  -- Mock initialization logic
  initialized = true
  engine.settings = settings

  return true
end
```

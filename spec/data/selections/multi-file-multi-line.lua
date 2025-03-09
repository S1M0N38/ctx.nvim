return {
  {
    bufnr = 1, -- spec/data/src/modules/users.lua
    end_lnum = 28,
    lnum = 23,
    pattern = "",
    text = 'function users.loadAll()\n  -- Mock data\n  users.create("John", "john@example ...',
    user_data = {
      breadcrumbs = "function users.loadAll()",
      lines = {
        "function users.loadAll()",
        "  -- Mock data",
        '  users.create("John", "john@example.com")',
        '  users.create("Alice", "alice@example.com")',
        "  return userList",
        "end",
      },
    },
    valid = 1,
  },
  {
    bufnr = 2, -- spec/data/src/main.lua
    end_lnum = 21,
    lnum = 9,
    pattern = "",
    text = 'local function main()\n  logger.log("Application starting")\n\n  if config.debu ...',
    user_data = {
      breadcrumbs = "local function main()",
      lines = {
        "local function main()",
        '  logger.log("Application starting")',
        "",
        "  if config.debug then",
        '    logger.log("Debug mode enabled")',
        "  end",
        "",
        "  engine.initialize(config.settings)",
        "  users.loadAll()",
        "",
        '  logger.log("Application ready")',
        "  return true",
        "end",
      },
    },
    valid = 1,
  },
  {
    bufnr = 3, -- spec/data/src/lib/core/engine.lua
    end_lnum = 17,
    lnum = 7,
    pattern = "",
    text = "function engine.initialize(settings)\n  if initialized then\n    return false\n ...",
    user_data = {
      breadcrumbs = "function engine.initialize(settings)",
      lines = {
        "function engine.initialize(settings)",
        "  if initialized then",
        "    return false",
        "  end",
        "",
        "  -- Mock initialization logic",
        "  initialized = true",
        "  engine.settings = settings",
        "",
        "  return true",
        "end",
      },
    },
    valid = 1,
  },
  245,
}

-- lua/ctx/log.lua
--[[
Inspired by rxi/log.lua
Modified by tjdevries and can be found at github.com/tjdevries/vlog.nvim

This library is free software; you can redistribute it and/or modify it
under the terms of the MIT license. See LICENSE for details.

Check out NOTICE.md for more information about the original code.
--]]

local M = {}

-- Default config before setup is called
local default_config = {
  plugin = "ctx.nvim",
  use_console = false, -- Conservative defaults before setup
  use_file = false, -- Conservative defaults before setup
  level = "warn", --Conservative defaults before setup
  modes = {
    { name = "trace", level = vim.log.levels.TRACE },
    { name = "debug", level = vim.log.levels.DEBUG },
    { name = "info", level = vim.log.levels.INFO },
    { name = "warn", level = vim.log.levels.WARN },
    { name = "error", level = vim.log.levels.ERROR },
  },
  float_precision = 0.01,
}

-- Current active config
local config = vim.deepcopy(default_config)

--- Setup the logger
---@param opts Ctx.Options User options
M.setup = function(opts)
  if opts then
    -- Update config with user options
    config.use_console = opts.log.use_console
    config.use_file = opts.log.use_file
    config.level = opts.log.level
  end

  -- Re-initialize logger with new config
  M._initialize()
end

--- Initialize the logger
M._initialize = function()
  local outfile = string.format("%s/%s.log", vim.fn.stdpath("data"), config.plugin)

  local levels = {}
  for i, v in ipairs(config.modes) do
    levels[v.name] = i
  end

  local round = function(x, increment)
    increment = increment or 1
    x = x / increment
    return (x > 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)) * increment
  end

  local make_string = function(...)
    local t = {}
    for i = 1, select("#", ...) do
      local x = select(i, ...)

      if type(x) == "number" and config.float_precision then
        x = tostring(round(x, config.float_precision))
      elseif type(x) == "table" then
        x = vim.inspect(x)
      else
        x = tostring(x)
      end

      t[#t + 1] = x
    end
    return table.concat(t, " ")
  end

  local log_at_level = function(level, level_config, message_maker, ...)
    -- Return early if we're below the config.level
    if level < levels[config.level] then
      return
    end
    local nameupper = level_config.name:upper()

    local msg = message_maker(...)
    local info = debug.getinfo(2, "Sl")
    local lineinfo = info.short_src .. ":" .. info.currentline

    -- Output to console
    if config.use_console then
      local console_string = string.format("[%s] %s: %s", nameupper, lineinfo, msg)
      vim.notify(console_string, level_config.level, { title = config.plugin })
    end

    -- Output to log file
    if config.use_file then
      local fp = io.open(outfile, "a")
      local str = string.format("[%-6s%s] %s: %s\n", nameupper, os.date(), lineinfo, msg)
      if fp then
        fp:write(str)
        fp:close()
      else
        error("Error opening log file: " .. outfile)
      end
    end
  end

  for i, x in ipairs(config.modes) do
    M[x.name] = function(...)
      return log_at_level(i, x, make_string, ...)
    end

    M[("fmt_%s"):format(x.name)] = function()
      return log_at_level(i, x, function(...)
        local passed = { ... }
        local fmt = table.remove(passed, 1)
        local inspected = {}
        for _, v in ipairs(passed) do
          table.insert(inspected, vim.inspect(v))
        end
        return string.format(fmt, unpack(inspected))
      end)
    end
  end
end

-- Initialize with default conservative settings
M._initialize()

---@type Ctx.Log
return M

--[[ log.lua

Inspired by rxi/log.lua
Modified by tjdevries and can be found at github.com/tjdevries/vlog.nvim

This library is free software; you can redistribute it and/or modify it
under the terms of the MIT license. See LICENSE for details.

Check out NOTICE.md for more information about the original code.
--]]

-- User configuration section
local default_config = {
  -- Name of the plugin. Prepended to log messages
  plugin = "ctx.nvim",

  -- Should print the output to neovim while running
  use_console = require("ctx.config").options.log.use_console,

  -- Should write to a file
  use_file = require("ctx.config").options.log.use_file,

  -- Any messages above this level will be logged.
  level = require("ctx.config").options.log.level,

  -- Level configuration
  modes = {
    { name = "trace", level = vim.log.levels.TRACE },
    { name = "debug", level = vim.log.levels.DEBUG },
    { name = "info", level = vim.log.levels.INFO },
    { name = "warn", level = vim.log.levels.WARN },
    { name = "error", level = vim.log.levels.ERROR },
  },

  -- Can limit the number of decimals displayed for floats
  float_precision = 0.01,
}

local log = {}

log.new = function(config, standalone)
  config = vim.tbl_deep_extend("force", default_config, config)
  local outfile = string.format("%s/%s.log", vim.fn.stdpath("data"), config.plugin)

  local obj
  if standalone then
    obj = log
  else
    obj = {}
  end

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
    obj[x.name] = function(...)
      return log_at_level(i, x, make_string, ...)
    end

    obj[("fmt_%s"):format(x.name)] = function()
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

log.new(default_config, true)

return log

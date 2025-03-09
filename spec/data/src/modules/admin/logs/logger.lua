-----------------------------------------
-- modules/admin/logs/logger.lua
-----------------------------------------
local logger = {}

function logger.log(message, level)
  level = level or "INFO"

  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  local entry = string.format("[%s] [%s] %s", timestamp, level, message)

  print(entry)

  -- In a real implementation, we might write to a file
  return entry
end

function logger.error(message)
  return logger.log(message, "ERROR")
end

function logger.debug(message)
  return logger.log(message, "DEBUG")
end

return logger

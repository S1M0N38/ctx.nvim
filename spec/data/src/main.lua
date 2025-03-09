-----------------------------------------
-- main.lua
-----------------------------------------
local config = require("config")
local engine = require("lib.core.engine")
local users = require("modules.users")
local logger = require("modules.admin.logs.logger")

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

main()

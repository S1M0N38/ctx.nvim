-- lua/ctx/parse.lua
local log = require("ctx.log")

local M = {}

--- Convert a file item to markdown
---@param item Ctx.Items.Item The file item to convert
---@return string
M.file = function(item)
  log.debug("Converting file item to markdown")
  return ""
end

--- Convert a selection item to markdown
---@param item Ctx.Items.Item The selection item to convert
---@return string
M.selection = function(item)
  log.debug("Converting selection item to markdown")
  return ""
end

--- Convert a diagnostic item to markdown
---@param item Ctx.Items.Item The diagnostic item to convert
---@return string
M.diagnostic = function(item)
  log.debug("Converting diagnostic item to markdown")
  return ""
end

--- Convert an item to markdown
---@param item Ctx.Items.Item The item to convert
---@return string
M.item = function(item)
  --- TODO: make use of the item specific functions
  return ""
end

---@type Ctx.Parse
return M

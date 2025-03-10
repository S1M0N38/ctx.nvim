-- lua/ctx/parse.lua
local log = require("ctx.log")

local M = {}

--- Convert a selection item to markdown
---@param item Ctx.Items.Item The selection item to convert
---@return string
M.selection = function(item)
  return ""
end

---@type Ctx.Parse
return M

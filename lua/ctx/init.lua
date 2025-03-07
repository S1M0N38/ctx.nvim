local M = {}

---Setup the Ctx plugin
---@param opts Ctx.Options Plugin options
M.setup = function(opts)
  require("ctx.config").setup(opts)
  require("ctx.log").setup(opts)
end

--TODO: add other functions

---@type Ctx
return M

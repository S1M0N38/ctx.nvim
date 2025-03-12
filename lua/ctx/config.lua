-- lua/ctx/config.lua
local M = {}

---@type Ctx.Options
M.defaults = {
  log = {
    level = "warn",
    use_console = true,
    use_file = false,
  },
}

---@type Ctx.Options
---@diagnostic disable-next-line: missing-fields
M.options = {}

---Extend the defaults options table with the user options
---@param opts Ctx.Options Plugin options
M.setup = function(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
  require("ctx.log").setup(M.options)
end

---@type Ctx.Config
return M

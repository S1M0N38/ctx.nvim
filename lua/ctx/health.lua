local M = {}

---Validate the options table obtained from merging defaults and user options
local function validate_opts_table()
  local opts = require("ctx.config").options

  local ok, err = pcall(function()
    vim.validate({
      --- validate other options here...
    })
  end)

  if not ok then
    vim.health.error("Invalid setup options: " .. err)
  else
    vim.health.ok("opts are correctly set")
  end
end

---This function is used to check the health of the plugin
---It's called by `:checkhealth` command
M.check = function()
  vim.health.start("mcp.nvim health check")

  validate_opts_table()

  -- Add more checks:
  --  - check for requirements (curl, etc.)
  --  - check for Neovim options
  --  - check for other plugins required
  --  - check for LSP setup
  --  - check for TS setup
  --  ...
end

---@type Ctx.Health
return M

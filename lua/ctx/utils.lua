-- lua/ctx/utils.lua
local log = require("ctx.log")

local M = {}

--- Highlight quickfix/loclist item
---@param item Ctx.Items.Item Item to highlight
---@param timeout integer? duration in milliseconds
---@return nil
M.highlight = function(item, timeout)
  timeout = 100 or timeout
  local ns_id = vim.api.nvim_create_namespace("ctx_highlight")
  local buf = item.bufnr
  local start_line = item.lnum
  local end_line = item.end_lnum or item.lnum

  -- Apply highlight
  for i = start_line, end_line do
    vim.api.nvim_buf_add_highlight(buf, ns_id, "IncSearch", i - 1, 0, -1)
  end

  -- Clear highlight after timeout
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)
  end, timeout)

  log.debug("highlighted lines: [" .. start_line .. ", " .. end_line .. "]")
end

---@type Ctx.Utils
return M

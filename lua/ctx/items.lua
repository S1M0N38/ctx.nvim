-- lua/ctx/items.lua
local log = require("ctx.log")

local M = {}

--- Convert the current visual selection into a quickfix/loclist item
---@return Ctx.Items.Selection?
M.selection = function()
  -- Check if we are in visual mode
  local mode = vim.fn.mode()
  if not (mode == "v" or mode == "V") then
    log.warn("add_selection must be called in visual mode")
    return
  end

  -- Update <,> registers and escape from visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", true)

  -- Get the visual selection boundaries
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]
  log.debug("selected lines: [" .. start_line .. ", " .. end_line .. "]")

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local breadcrumbs = vim.fn["nvim_treesitter#statusline"]({
    indicator_size = 120,
    type_patterns = { "class", "function", "method", "impl", "struct" },
    separator = " > ",
    allow_duplicates = false,
  })
  log.debug("breadcrumbs:", breadcrumbs)

  ---@type Ctx.Items.Selection
  local item = {
    bufnr = vim.api.nvim_get_current_buf(),
    lnum = start_line,
    end_lnum = end_line,
    text = string.sub(table.concat(lines, "\n"), 1, 76) .. " ...",
    user_data = lines,
  }

  return item
end

---@type Ctx.Items
return M

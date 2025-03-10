-- lua/ctx/items.lua
local log = require("ctx.log")

local M = {}

--- Convert the current visual selection into a quickfix/loclist item
---@return Ctx.Items.Item?
M.selection = function()
  -- Check if we are in visual mode
  local mode = vim.fn.mode()
  if not (mode == "v" or mode == "V") then
    log.error("add_selection must be called in visual mode")
    return
  end

  -- Update <,> registers and escape from visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", true)

  -- Get the visual selection boundaries
  local start_line = vim.fn.getpos("'<")[2]
  local end_line = vim.fn.getpos("'>")[2]
  log.debug("selected lines: [" .. start_line .. ", " .. end_line .. "]")

  local bufnr = vim.api.nvim_get_current_buf()
  local bufname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":~:.")
  -- NOTE: this bufname is simply relative to cwd and does not implement project root discovery

  ---@type Ctx.Items.Item
  local item = {
    bufnr = bufnr,
    lnum = start_line,
    end_lnum = end_line,
    text = bufname .. ":" .. start_line .. "-" .. end_line,
    pattern = "",
    valid = 1,
  }

  return item
end

---@type Ctx.Items
return M

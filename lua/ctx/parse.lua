-- lua/ctx/parse.lua
local log = require("ctx.log")

local M = {}

--- Convert a file item to markdown
---@param item Ctx.Items.Item The file item to convert
---@return string
M.file = function(item)
  local filetype = vim.api.nvim_get_option_value("ft", { buf = item.bufnr })
  local lines = vim.api.nvim_buf_get_lines(item.bufnr, 0, -1, false)
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(item.bufnr), ":.")
  table.insert(lines, 1, "```" .. filetype .. " " .. filename)
  table.insert(lines, "```")
  return table.concat(lines, "\n")
end

--- Convert a selection item to markdown
---@param item Ctx.Items.Item The selection item to convert
---@return string
M.selection = function(item)
  local filetype = vim.api.nvim_get_option_value("ft", { buf = item.bufnr })
  local lines = vim.api.nvim_buf_get_lines(item.bufnr, item.lnum - 1, item.end_lnum, false)
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(item.bufnr), ":.")
  if item.lnum == item.end_lnum then
    return "```" .. filetype .. " " .. filename .. ":" .. item.lnum .. "\n" .. lines[1] .. "\n```"
  else
    table.insert(lines, 1, "```" .. filetype .. " " .. filename .. ":" .. item.lnum .. "-" .. item.end_lnum)
    table.insert(lines, "```")
    return table.concat(lines, "\n")
  end
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

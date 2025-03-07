-- lua/ctx/parse.lua
local log = require("ctx.log")

local M = {}

local severities = {
  E = vim.diagnostic.severity.ERROR,
  W = vim.diagnostic.severity.WARN,
  I = vim.diagnostic.severity.INFO,
  H = vim.diagnostic.severity.HINT,
  N = vim.diagnostic.severity.HINT,
}

--- Convert a selection item to markdown
---@param item Ctx.Items.Selection The selection item to convert
---@return string Formatted markdown
M.selection = function(item)
  -- Get basic information
  local buf_name = vim.api.nvim_buf_get_name(item.bufnr)
  local file_name = vim.fn.fnamemodify(buf_name, ":~:.")
  local line_range = item.lnum .. "-" .. item.end_lnum

  -- Get filetype for syntax highlighting
  local filetype = vim.bo[item.bufnr].filetype
  filetype = filetype ~= "" and filetype or "text"

  -- Format as markdown
  local lines = {
    "### Selection from " .. file_name .. " (lines " .. line_range .. ")",
    "",
    "```" .. filetype,
  }

  -- Add all selected lines
  for _, line in ipairs(item.user_data) do
    table.insert(lines, line)
  end

  table.insert(lines, "```")
  table.insert(lines, "")

  return table.concat(lines, "\n")
end

-- JUST for debug
local items = vim.fn.getqflist()
for i, item in ipairs(items) do
  log.debug("item: " .. vim.inspect(item))
end

return M

--[[
-- The following code is the source implementation for the snacks picker.
-- It parse the quickfix list items to show them using the picker.
-- My functions written in this parse file do a similar thing; parse the quickfix list items to well formatter
-- markdown.
--]]

-- ---@param opts snacks.picker.qf.Config
-- ---@type snacks.picker.finder
-- function M.qf(opts, ctx)
--   local win = opts.qf_win
--   win = win == 0 and vim.api.nvim_get_current_win() or win
--
--   local list = win and vim.fn.getloclist(win, { all = true }) or vim.fn.getqflist({ all = true })
--   ---@cast list { items?: qf.item[] }?
--
--   local ret = {} ---@type snacks.picker.finder.Item[]
--
--   for _, item in pairs(list and list.items or {}) do
--     local row = item.lnum == 0 and 1 or item.lnum
--     local col = (item.col == 0 and 1 or item.col) - 1
--     local end_row = item.end_lnum == 0 and row or item.end_lnum
--     local end_col = item.end_col == 0 and col or (item.end_col - 1)
--
--     if item.valid == 1 then
--       local file = item.filename or item.bufnr and vim.api.nvim_buf_get_name(item.bufnr) or nil
--       local text = item.text or ""
--       ret[#ret + 1] = {
--         pos = { row, col },
--         end_pos = item.end_lnum ~= 0 and { end_row, end_col } or nil,
--         text = file .. " " .. text,
--         line = item.text,
--         file = file,
--         severity = severities[item.type] or 0,
--         buf = item.bufnr,
--         item = item,
--       }
--     elseif #ret > 0 and ret[#ret].item.text and item.text then
--       ret[#ret].item.text = ret[#ret].item.text .. "\n" .. item.text
--       ret[#ret].item.line = ret[#ret].item.line .. "\n" .. item.text
--     end
--   end
--   return ctx.filter:filter(ret)
-- end
--
-- return M

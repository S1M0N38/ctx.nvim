-- lua/ctx/parse.lua

local M = {}

local diagnostics = {
  N = "note",
  I = "info",
  W = "warning",
  E = "error",
}

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
  local filetype = vim.api.nvim_get_option_value("ft", { buf = item.bufnr })
  local commentstring = vim.api.nvim_get_option_value("commentstring", { buf = item.bufnr })
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(item.bufnr), ":.")

  -- region around the diagnostic
  local offset = 2
  local top_lines_index = math.max(item.lnum - offset, 0)
  local bot_lines_index = math.min(item.lnum + offset, vim.api.nvim_buf_line_count(item.bufnr))
  local top_lines = vim.api.nvim_buf_get_lines(item.bufnr, top_lines_index - 1, item.lnum - 1, false)
  local bot_lines = vim.api.nvim_buf_get_lines(item.bufnr, item.lnum, bot_lines_index, false)

  -- add diagnostic message
  local line = vim.api.nvim_buf_get_lines(item.bufnr, item.lnum - 1, item.lnum, false)[1]
  local comment = diagnostics[item.type] .. ": " .. item.text
  line = line .. " " .. string.format(commentstring, comment)

  -- generate snippet
  local lines = {}
  local header
  if top_lines_index == bot_lines_index then
    header = "```" .. filetype .. " " .. filename .. ":" .. item.lnum
  else
    header = "```" .. filetype .. " " .. filename .. ":" .. top_lines_index .. "-" .. bot_lines_index
  end
  table.insert(lines, header)
  for _, l in ipairs(top_lines) do
    table.insert(lines, l)
  end
  table.insert(lines, line)
  for _, l in ipairs(bot_lines) do
    table.insert(lines, l)
  end
  table.insert(lines, "```")

  return table.concat(lines, "\n")
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

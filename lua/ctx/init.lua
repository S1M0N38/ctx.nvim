-- lua/ctx/init.lua
local M = {}

---Setup the Ctx plugin
---@param opts Ctx.Options Plugin options
M.setup = function(opts)
  require("ctx.config").setup(opts)
  require("ctx.log").setup(opts)
end

---Convert the quickfix list to markdown
---@param id integer? The unique quickfix list index. Default is 0 (current quickfix list)
---@return string
M.qflist_to_md = function(id)
  local items = vim.fn.getqflist({ id = id or 0, items = {} }).items
  local md = {}
  for _, item in ipairs(items) do
    vim.fn.bufload(item.bufnr)
    table.insert(md, require("ctx.parse").item(item))
  end

  return table.concat(md, "\n\n")
end

---Convert a location list to markdown
---@param nr integer The window number of the location list
---@return string
M.loclist_to_md = function(nr)
  local items = vim.fn.getloclist(nr, { items = {} }).items
  local md = {}
  for _, item in ipairs(items) do
    vim.fn.bufload(item.bufnr)
    table.insert(md, require("ctx.parse").item(item))
  end
  return table.concat(md, "\n\n")
end

---@type Ctx
return M

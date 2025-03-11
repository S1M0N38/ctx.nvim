local parse = require("ctx.parse")

local paths = {
  files = {
    ---@diagnostic disable-next-line
    lua = vim.fn.globpath("spec/data/files", "*.lua", false, true),
    ---@diagnostic disable-next-line
    md = vim.fn.globpath("spec/data/files", "*.md", false, true),
  },
  selections = {
    ---@diagnostic disable-next-line
    lua = vim.fn.globpath("spec/data/selections", "*.lua", false, true),
    ---@diagnostic disable-next-line
    md = vim.fn.globpath("spec/data/selections", "*.md", false, true),
  },
  diagnostics = {
    ---@diagnostic disable-next-line
    lua = vim.fn.globpath("spec/data/diagnostics", "*.lua", false, true),
    ---@diagnostic disable-next-line
    md = vim.fn.globpath("spec/data/diagnostics", "*.md", false, true),
  },
  all = {
    ---@diagnostic disable-next-line
    lua = vim.fn.globpath("spec/data", "{diagnostics,selections,files}/*.lua", false, true),
    ---@diagnostic disable-next-line
    md = vim.fn.globpath("spec/data", "{diagnostics,selections,files}/*.md", false, true),
  },
}

local function read_file(filepath)
  local lines = vim.fn.readfile(filepath)
  return table.concat(lines, "\n")
end

-- Helper function to get appropriate commentstring
local function commentstring(ft)
  return ({
    lua = "-- %s",
    -- add other commentstring mappings here ...
  })[ft]
end

local function load_buffer(item)
  local bufnr = vim.api.nvim_create_buf(false, true)
  -- set lines
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.fn.readfile(item.filename))
  -- set options
  local filetype = vim.filetype.match({ filename = item.filename })
  vim.api.nvim_set_option_value("filetype", filetype, { buf = bufnr })
  vim.api.nvim_set_option_value("commentstring", commentstring(filetype), { buf = bufnr })
  -- set filename
  vim.api.nvim_buf_set_name(bufnr, item.filename)
  -- update item to standard representation
  item.bufnr = bufnr
  item.filename = nil
end

local function unload_buffer(item)
  vim.api.nvim_buf_delete(item.bufnr, { force = true })
end

describe("[#parse #files] parse.file function tests", function()
  for i = 1, #paths.files.lua do
    it(string.format("parse file item correctly (#%d/%d)", i, #paths.files.lua), function()
      local items = dofile(paths.files.lua[i])
      local output_md = {}
      for _, item in ipairs(items) do
        load_buffer(item)
        table.insert(output_md, parse.file(item))
        unload_buffer(item)
      end
      local expected_md = read_file(paths.files.md[i])
      assert.are.equal(expected_md, table.concat(output_md, "\n\n"))
    end)
  end
end)

describe("[#parse #selections] parse.selection function tests", function()
  for i = 1, #paths.selections.lua do
    it(string.format("parse selection item correctly (#%d/%d)", i, #paths.selections.lua), function()
      local items = dofile(paths.selections.lua[i])
      local output_md = {}
      for _, item in ipairs(items) do
        load_buffer(item)
        table.insert(output_md, parse.selection(item))
        unload_buffer(item)
      end
      local expected_md = read_file(paths.selections.md[i])
      assert.are.equal(expected_md, table.concat(output_md, "\n\n"))
    end)
  end
end)

describe("[#parse #diagnostics] parse.diagnostic function tests", function()
  for i = 1, #paths.diagnostics.lua do
    it(string.format("parse diagnostic item correctly (#%d/%d)", i, #paths.diagnostics.lua), function()
      local items = dofile(paths.diagnostics.lua[i])
      local output_md = {}
      for _, item in ipairs(items) do
        load_buffer(item)
        table.insert(output_md, parse.diagnostic(item))
        unload_buffer(item)
      end
      local expected_md = read_file(paths.diagnostics.md[i])
      assert.are.equal(expected_md, table.concat(output_md, "\n\n"))
    end)
  end
end)

describe("[#parse #items] parse.items function tests", function()
  for i = 1, #paths.all.lua do
    it(string.format("parse diagnostic item correctly (#%d/%d)", i, #paths.all.lua), function()
      local items = dofile(paths.all.lua[i])
      local output_md = {}
      for _, item in ipairs(items) do
        load_buffer(item)
        table.insert(output_md, parse.item(item))
        unload_buffer(item)
      end
      local expected_md = read_file(paths.all.md[i])
      assert.are.equal(expected_md, table.concat(output_md, "\n\n"))
    end)
  end
end)

local parse = require("ctx.parse")

local function read_file(filepath)
  local lines = vim.fn.readfile(filepath)
  return table.concat(lines, "\n")
end

local function load_buffer(item)
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.fn.readfile(item.filename))
  item.bufnr = bufnr -- Add bufnr to item
  print("Loaded buffer:", item.bufnr, item.filename)
end

local function unload_buffer(item)
  vim.api.nvim_buf_delete(item.bufnr, { force = true })
  print("Unloaded buffer:", item.bufnr)
end

describe("[#parse #files] parse.file function tests", function()
  local data_path = "spec/data/files"
  local lua_files = vim.fn.globpath(data_path, "*.lua", false, true)
  local md_files = vim.fn.globpath(data_path, "*.md", false, true)

  for i = 1, #lua_files do
    it(string.format("parse file item correctly (#%d/%d)", i, #lua_files), function()
      local items = dofile(lua_files[i])
      local output_md = {}
      for _, item in ipairs(items) do
        load_buffer(item)
        table.insert(output_md, parse.file(item))
        unload_buffer(item)
      end
      local expected_md = read_file(md_files[i])
      assert.are.equal(expected_md, table.concat(output_md, "\n"))
    end)
  end
end)

describe("[#parse #selections] parse.selection function tests", function()
  local data_path = "spec/data/selections"
  local lua_files = vim.fn.globpath(data_path, "*.lua", false, true)
  local md_files = vim.fn.globpath(data_path, "*.md", false, true)

  for i = 1, #lua_files do
    it(string.format("parse selection item correctly (#%d/%d)", i, #lua_files), function()
      local items = dofile(lua_files[i])
      local output_md = {}
      for _, item in ipairs(items) do
        load_buffer(item)
        table.insert(output_md, parse.selection(item))
        unload_buffer(item)
      end
      local expected_md = read_file(md_files[i])
      assert.are.equal(expected_md, table.concat(output_md, "\n"))
    end)
  end
end)

describe("[#parse #diagnostics] parse.diagnostic function tests", function()
  local data_path = "spec/data/diagnostics"
  local lua_files = vim.fn.globpath(data_path, "*.lua", false, true)
  local md_files = vim.fn.globpath(data_path, "*.md", false, true)

  for i = 1, #lua_files do
    it(string.format("parse diagnostic item correctly (#%d/%d)", i, #lua_files), function()
      local items = dofile(lua_files[i])
      local output_md = {}
      for _, item in ipairs(items) do
        load_buffer(item)
        table.insert(output_md, parse.file(item))
        unload_buffer(item)
      end
      local expected_md = read_file(md_files[i])
      assert.are.equal(expected_md, table.concat(output_md, "\n"))
    end)
  end
end)

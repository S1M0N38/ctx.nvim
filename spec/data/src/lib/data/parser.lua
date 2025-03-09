-----------------------------------------
-- lib/data/parser.lua
-----------------------------------------
local parser = {}

function parser.parseCSV(content)
  local result = {}

  for line in content:gmatch("[^\r\n]+") do
    local row = {}
    for value in line:gmatch("[^,]+") do
      table.insert(row, value)
    end
    table.insert(result, row)
  end

  return result
end

function parser.parseJSON(content)
  -- Simplified mock JSON parser
  return {
    parsed = true,
    content = content,
  }
end

return parser

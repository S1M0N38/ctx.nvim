-----------------------------------------
-- lib/data/loader.lua
-----------------------------------------
local loader = {}

function loader.loadFile(filename)
  local file = io.open(filename, "r")
  if not file then
    return nil, "File not found"
  end

  local content = file:read("*all")
  file:close()

  return content
end

function loader.saveFile(filename, content)
  local file = io.open(filename, "w")
  if not file then
    return false, "Cannot create file"
  end

  file:write(content)
  file:close()

  return true
end

return loader

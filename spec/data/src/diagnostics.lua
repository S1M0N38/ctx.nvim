--[[
--    This file is used to manually tables in file ctx.nvim/spec/data/diagnostics/*.lua
--    The item is add to the quickfix in various ways and then its table representation
--    is printed out. That table is used for testing the parsing from the quickfix item
--    representation to the expected markdown representation.
--
--    There are diagnostics note, info, warning and error on purpose so we can generate
--    quickfix for them. Do not remove them.
--]]

function factorial(n)
  -- Nested function to validate input
  local function validate(x, y)
    if type(x) ~= "number" or x < 0 or math.floor(x) ~= x then
      error("factorial requires a non-negative integer")
    end
    return x
  end

  n = validate(m)
  if n <= 1 then
    return 1
  else
    return m * factorial(n - 1,)
  end
end

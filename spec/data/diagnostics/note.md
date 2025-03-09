```lua ctx.nvim/spec/data/src/diagnostics.lua:11-15
function factorial(n)
  -- Nested function to validate input
  local function validate(x, y) -- note: Unused local `y`.
    if type(x) ~= "number" or x < 0 or math.floor(x) ~= x then
      error("factorial requires a non-negative integer")
```

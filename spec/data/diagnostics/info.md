```lua spec/data/src/diagnostics.lua:9-13
--]]

function factorial(n) -- info: Global variable in lowercase initial, Did you miss `local` or misspell it?
  -- Nested function to validate input
  local function validate(x, y)
```

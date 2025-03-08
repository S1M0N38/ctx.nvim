diagnostics: ctx.nvim/spec/data/example.lua

```lua
--]]

function factorial(n)
// info: Global variable in lowercase initial, Did you miss `local` or misspell it?
  -- Nested function to validate input
  local function validate(x, y)
```

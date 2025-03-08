diagnostics: ctx.nvim/spec/data/example.lua

```lua
--]]

function factorial(n)
// info: Global variable in lowercase initial, Did you miss `local` or misspell it?
  -- Nested function to validate input
  local function validate(x, y)
```

```lua
function factorial(n)
  -- Nested function to validate input
  local function validate(x, y)
// note: Unused local `y`.
    if type(x) ~= "number" or x < 0 or math.floor(x) ~= x then
      error("factorial requires a non-negative integer")
```

```lua
  end

  n = validate(m)
// warning: Undefined global `m`.
  if n <= 1 then
    return 1
```

```lua
    return 1
  else
    return n * factorial(n - 1,)
// error: <exp> expected.
  end
end
```

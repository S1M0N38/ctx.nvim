```lua spec/data/src/diagnostics.lua:9-13
--]]

function factorial(n) -- info: Global variable in lowercase initial, Did you miss `local` or misspell it?
  -- Nested function to validate input
  local function validate(x, y)
```

```lua spec/data/src/diagnostics.lua:11-15
function factorial(n)
  -- Nested function to validate input
  local function validate(x, y) -- note: Unused local `y`.
    if type(x) ~= "number" or x < 0 or math.floor(x) ~= x then
      error("factorial requires a non-negative integer")
```

```lua spec/data/src/diagnostics.lua:18-22
  end

  n = validate(m) -- warning: Undefined global `m`.
  if n <= 1 then
    return 1
```

```lua spec/data/src/diagnostics.lua:22-25
    return 1
  else
    return m * factorial(n - 1,) -- warning: Undefined global `m`.
  end
end
```

```lua spec/data/src/diagnostics.lua:22-25
    return 1
  else
    return m * factorial(n - 1,) -- error: <exp> expected.
  end
end
```

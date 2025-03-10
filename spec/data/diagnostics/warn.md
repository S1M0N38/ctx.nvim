```lua spec/data/src/diagnostics.lua:18-22
  end

  n = validate(m) -- warning: Undefined global `m`.
  if n <= 1 then
    return 1
```

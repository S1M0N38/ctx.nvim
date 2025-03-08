diagnostics: ctx.nvim/spec/data/example.lua

```lua
  end

  n = validate(m)
// warning: Undefined global `m`.
  if n <= 1 then
    return 1
```

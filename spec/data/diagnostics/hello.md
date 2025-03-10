```lua spec/data/src/hello.lua:1-3
user = "John" -- info: Global variable in lowercase initial, Did you miss `local` or misspell it?
print("Hello " .. user .. "!",)

```

```lua spec/data/src/hello.lua:1-4
user = "John"
print("Hello " .. user .. "!",) -- error: <exp> expected.

-- There are diagnostics and syntax errors in this file on purpose
```

```lua spec/data/src/hello.lua:3-5

-- There are diagnostics and syntax errors in this file on purpose
print(Hi) -- warning: Undefined global `Hi`.
```

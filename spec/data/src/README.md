This is a mock project just used to test `ctx.nvim`.

- It replicate a project with nested directories and files (like the real ones).
- The file `diagnotics.lua` contains diagnostics errors, warning, info and notes on purpose.

**Project structure:**

```
.
├── main.lua
├── diagnostics.lua
├── config.lua
├── lib/
│   ├── utils.lua
│   ├── data/
│   │   ├── loader.lua
│   │   └── parser.lua
│   └── core/
│       ├── engine.lua
│       └── events.lua
└── modules/
    ├── users.lua
    └── admin/
        ├── permissions.lua
        └── logs/
            └── logger.lua
```

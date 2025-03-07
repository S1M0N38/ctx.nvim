---@meta
--- This is a simple "definition file" (https://luals.github.io/wiki/definition-files/),
--- the @meta tag at the top is its hallmark.

-- init.lua --------------------------------------------------------------------

---@class Ctx
---@field setup fun(opts: Ctx.Options): nil Setup the plugin

-- config.lua -----------------------------------------------------------------

---@class Ctx.Config
---@field defaults Ctx.Options: Default options
---@field options Ctx.Options: User options
---@field setup fun(opts: Ctx.Options): nil Extend the defaults options table with the user options

---@class Ctx.Options
---@field log Ctx.Options.Log: Log options

---@class Ctx.Options.Log
---@field level "trace"|"debug"|"info"|"warn"|"error": Log level
---@field use_console boolean: Log to console
---@field use_file boolean: Log to file

-- log.lua --------------------------------------------------------------------

---@class Ctx.Log
---@field setup fun(opts: Ctx.Options): nil Setup the logger
---@field _initialize fun(): nil Initialize the logger

-- health.lua -----------------------------------------------------------------

---@class Ctx.Health
---@field check fun(): nil Check the health of the plugin

-- items.lua ------------------------------------------------------------------

---@class Ctx.Items
---@field selection fun(): Ctx.Items.Selection? Selected lines as quickfix/loclist item

---@class Ctx.Items.Base
---@field bufnr number Buffer number
---@field lnum number First line number
---@field end_lnum number? End line number

---@class Ctx.Items.Selection: Ctx.Items.Base
---@field text string First 80 characters of the selected lines
---@field user_data table<string> Lines of the selection

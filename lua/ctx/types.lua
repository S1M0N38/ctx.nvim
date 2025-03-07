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

-- utils.lua ------------------------------------------------------------------

---@class Ctx.Utils
---@field highlight fun(item: Ctx.Items.Base, timeout: number?): nil Highlight quickfix/loclist item

-- items.lua ------------------------------------------------------------------

---@class Ctx.Items
---@field selection fun(): Ctx.Items.Selection? Selected lines as quickfix/loclist item

---Represents an item in a Neovim quickfix/loclist.
---@class Ctx.Items.Base
---@field bufnr? number The buffer number where the item originates.
---@field filename? string
---@field lnum number The start line number for the item.
---@field end_lnum? number The end line number for the item.
---@field pattern string A pattern related to the item. It can be a search pattern or any relevant string.
---@field col? number The column number where the item starts.
---@field end_col? number The column number where the item ends.
---@field module? string Module information (if any) associated with the item.
---@field nr? number A unique number or ID for the item.
---@field text? string A description or message related to the item.
---@field type? string The type of the item. E.g., "W" might stand for "Warning".
---@field valid number A flag indicating if the item is valid (1) or not (0).
---@field user_data? any Any user data associated with the item.
---@field vcol? number Visual column number. Indicates if the column number is a visual column number (when set to 1) or a byte index (when set to 0).

---@class Ctx.Items.Selection: Ctx.Items.Base
---@field text string First 80 characters of the selected lines
---@field user_data table<string> Lines of the selection

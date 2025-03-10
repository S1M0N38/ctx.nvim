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
---@field level "debug"|"info"|"warn"|"error": Log level
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
---@field highlight fun(item: Ctx.Items.Item, timeout: integer?): nil Highlight quickfix/loclist item

-- items.lua ------------------------------------------------------------------

---@class Ctx.Items
---@field selection fun(): Ctx.Items.Item? Selected lines as quickfix/loclist item

---Represents an item in a Neovim quickfix/loclist.
---@class Ctx.Items.Item
---@field bufnr integer The buffer number where the item originates.
---@field filename? string
---@field lnum integer The start line number for the item.
---@field end_lnum? integer The end line number for the item.
---@field pattern string A pattern related to the item. It can be a search pattern or any relevant string.
---@field col? integer The column number where the item starts.
---@field end_col? integer The column number where the item ends.
---@field module? string Module information (if any) associated with the item.
---@field nr? integer A unique number or ID for the item.
---@field text string A description or message related to the item.
---@field type? string The type of the item. E.g., "W" might stand for "Warning".
---@field valid integer A flag indicating if the item is valid (1) or not (0).
---@field user_data? any Any user data associated with the item.
---@field vcol? integer Visual column number. Indicates if the column number is a visual column number (when set to 1) or a byte index (when set to 0).

-- parse.lua ------------------------------------------------------------------

---@class Ctx.Parse
---@field file fun(Ctx.Items.Item): string Convert a file item to markdown
---@field selection fun(Ctx.Items.Item): string Convert a selection item to markdown
---@field diagnostic fun(Ctx.Items.Item): string Convert a diagnostic item to markdown
---@field item fun(Ctx.Items.Item): string Convert an item to markdown

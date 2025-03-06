---@meta
--- This is a simple "definition file" (https://luals.github.io/wiki/definition-files/),
--- the @meta tag at the top is its hallmark.

-- init.lua --------------------------------------------------------------------

---@class Ctx
---@field setup fun(opts: Ctx.Options): nil the plugin
---TODO: add Ctx fields

-- config.lua -----------------------------------------------------------------

---@class Ctx.Config
---@field defaults Ctx.Options: Default options
---@field options Ctx.Options: User options
---@field setup fun(opts: Ctx.Options): nil Extend the defaults options table with the user options

---@class Ctx.Options
---TODO: add options fields

-- health.lua -----------------------------------------------------------------

---@class Ctx.Health
---@field check fun(): nil Check the health of the plugin

-- lua/ctx/health.lua
local M = {}

---Validate the options table obtained from merging defaults and user options
local function validate_opts_table()
  local opts = require("ctx.config").options

  local ok, err = pcall(function()
    -- Validate main options structure
    vim.validate({
      ["options"] = { opts, "table" },
      ["options.log"] = { opts.log, "table" },
    })

    -- Validate log options
    vim.validate({
      ["options.log.level"] = {
        opts.log.level,
        "string",
        function(v)
          return vim.tbl_contains({ "trace", "debug", "info", "warn", "error" }, v)
        end,
        "must be one of: trace, debug, info, warn, error",
      },
      ["options.log.use_console"] = { opts.log.use_console, "boolean" },
      ["options.log.use_file"] = { opts.log.use_file, "boolean" },
    })

    -- Add validation for any additional options your plugin has
  end)

  if not ok then
    vim.health.error("Invalid setup options: " .. err)
  else
    vim.health.ok("Configuration options are valid")

    -- Additional checks on specific option values if needed
    if opts.log.level == "trace" or opts.log.level == "debug" then
      vim.health.info("Debug logging is enabled - this may affect performance")
    end
  end
end

-- Check Neovim version
local function check_neovim_version()
  local required_version = "0.10.0"
  local current_version = vim.version()
  local current_version_str =
    string.format("%d.%d.%d", current_version.major, current_version.minor, current_version.patch)

  if vim.fn.has("nvim-0.10") == 1 then
    vim.health.ok(string.format("Neovim version: %s (required: >= %s)", current_version_str, required_version))
  else
    vim.health.error(string.format("Neovim version: %s (required: >= %s)", current_version_str, required_version))
  end
end

-- Check if treesitter is available and has relevant parsers
local function check_treesitter()
  local has_treesitter = pcall(require, "nvim-treesitter")
  if has_treesitter then
    vim.health.ok("nvim-treesitter is installed")

    -- Check for parsers
    local parsers = { "lua", "markdown", "markdown_inline" }
    for _, parser in ipairs(parsers) do
      if pcall(vim.treesitter.language.add, parser) then
        vim.health.ok(string.format("TreeSitter %s parser is installed", parser))
      else
        vim.health.warn(string.format("TreeSitter %s parser is not installed (recommended)", parser))
      end
    end
  else
    -- TreeSitter isn't strictly required but helpful for markdown
    vim.health.warn("nvim-treesitter is not installed (recommended for better markdown handling)")
  end
end

-- Check if relevant APIs are available
local function check_apis()
  -- Check quickfix/location list APIs
  if vim.fn.exists("*getqflist") == 1 then
    vim.health.ok("getqflist API is available")
  else
    vim.health.error("getqflist API is not available (required)")
  end

  if vim.fn.exists("*getloclist") == 1 then
    vim.health.ok("getloclist API is available")
  else
    vim.health.error("getloclist API is not available (required)")
  end

  -- Check buffer APIs
  if vim.api.nvim_buf_get_lines and vim.api.nvim_buf_get_name then
    vim.health.ok("Buffer APIs are available")
  else
    vim.health.error("Required buffer APIs are missing")
  end
end

---This function is used to check the health of the plugin
---It's called by `:checkhealth` command
M.check = function()
  vim.health.start("ctx.nvim health check")

  check_neovim_version()
  check_treesitter()
  check_apis()
  validate_opts_table()
end

---@type Ctx.Health
return M

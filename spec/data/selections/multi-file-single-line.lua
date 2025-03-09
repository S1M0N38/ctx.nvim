return {
  {
    bufnr = 1, -- spec/data/src/main.lua
    col = 0,
    end_col = 0,
    end_lnum = 13,
    lnum = 13,
    module = "",
    nr = 0,
    pattern = "",
    text = '    logger.log("Debug mode enabled") ...',
    type = "",
    user_data = {
      breadcrumbs = "local function main()",
      lines = { '    logger.log("Debug mode enabled")' },
    },
    valid = 1,
    vcol = 0,
  },
  {
    bufnr = 2, -- spec/data/src/modules/admin/logs/logger.lua
    col = 0,
    end_col = 0,
    end_lnum = 23,
    lnum = 23,
    module = "",
    nr = 0,
    pattern = "",
    text = '  return logger.log(message, "DEBUG") ...',
    type = "",
    user_data = {
      breadcrumbs = "function logger.debug(message)",
      lines = { '  return logger.log(message, "DEBUG")' },
    },
    valid = 1,
    vcol = 0,
  },
}

return {
  {
    bufnr = 1, -- spec/data/src/diagnostics.lua
    end_lnum = 15,
    lnum = 15,
    pattern = "",
    text = '      error("factorial requires a non-negative integer") ...',
    user_data = {
      breadcrumbs = "function factorial(n) > local function validate(x, y)",
      lines = { '      error("factorial requires a non-negative integer")' },
    },
    valid = 1,
  },
}

return {
  {
    bufnr = 1, -- spec/data/src/diagnostics.lua
    end_lnum = 25,
    lnum = 20,
    pattern = "",
    text = "  n = validate(m)\n  if n <= 1 then\n    return 1\n  else\n    return n * factor ...",
    user_data = {
      breadcrumbs = "function factorial(n)",
      lines = {
        "  n = validate(m)",
        "  if n <= 1 then",
        "    return 1",
        "  else",
        "    return n * factorial(n - 1,)",
        "  end",
      },
    },
    valid = 1,
  },
}

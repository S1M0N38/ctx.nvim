<div align="center">
  <h1>⧉&nbsp;&nbsp;ctx.nvim&nbsp;&nbsp;<a href="https://github.com/S1M0N38/ai.nvim">✧</a></h1>
  <p align="center">
     <a href="https://github.com/S1M0N38/ctx.nvim/actions/workflows/run-tests.yml">
     <img alt="Tests workflow" src="https://img.shields.io/github/actions/workflow/status/S1M0N38/ctx.nvim/run-tests.yml?style=for-the-badge&label=Tests"/>
     </a>
     <a href="https://luarocks.org/modules/S1M0N38/ctx.nvim">
     <img alt="LuaRocks release" src="https://img.shields.io/luarocks/v/S1M0N38/ctx.nvim?style=for-the-badge&color=5d2fbf"/>
     </a>
     <a href="https://github.com/S1M0N38/ctx.nvim/releases">
     <img alt="GitHub release" src="https://img.shields.io/github/v/release/S1M0N38/ctx.nvim?style=for-the-badge&label=GitHub"/>
     </a>
     <a href="https://www.reddit.com/r/neovim/comments/.../">
     <img alt="Reddit post" src="https://img.shields.io/badge/post-reddit?style=for-the-badge&label=Reddit&color=FF5700"/>
     </a>
  </p>
  <div><img src="https://github.com/user-attachments/assets/8133dec4-d81f-40af-bdbc-2c23b08c60bd" alt="Screencast: ctx.nvim example usage"></div>
  <p><em>Quickfix / Location List Items → Markdown</em></p>
  <hr>
</div>

## 💡 Idea

In Neovim, the Quickfix List and Location List serve as powerful mechanisms for storing references to code locations (`:h quickfix`). These lists can be populated through traditional commands (`:make`, `:vim`, `:grep`), modern LSP functionality, or via plugin pickers like [Telescope](https://github.com/nvim-telescope/telescope.nvim), [fzf-lua](https://github.com/ibhagwan/fzf-lua), [snacks.picker](https://github.com/folke/snacks.nvim) and others.

These code references—enhanced with additional diagnostic information when coming from LSP diagnostics—represent valuable context that can significantly improve interactions with Large Language Models.

ctx.nvim bridges this gap by converting Quickfix and Location List items into well-formatted Markdown, creating digestible context for LLMs. The plugin focuses solely on this conversion functionality, allowing it to complement any LLM integration workflow without introducing unnecessary dependencies.

## ⚡️ Requirements

- Neovim ≥ **0.10**

## 📦 Installation

You can install ctx.nvim using your preferred plugin manager. Here's an example configuration for lazy.nvim:

```lua
-- Using lazy.nvim
{
  "S1M0N38/ctx.nvim",
  version = "*",
  opts = {},
  keys = {

    -- Add visual selection to Quickfix List
    {
      "<leader>q",
      function()
        local item = require("ctx.items").selection()
        require("ctx.utils").highlight(item)
        vim.fn.setqflist({ item }, "a")
      end,
      desc = "Add to Quickfix List",
      mode = { "v" },
    },
    -- Add visual selection to Location List
    {
      "<leader>l",
      function()
        local win = vim.api.nvim_get_current_win()
        local item = require("ctx.items").selection()
        require("ctx.utils").highlight(item)
        vim.fn.setloclist(win, { item }, "a")
      end,
      desc = "Add to Location List",
      mode = { "v" },
    },
    -- There are other ways to send items to Quickfix / Location list.
    -- For example, many pickers (telescope, fzf-lua, snacks.picker) can
    -- send items to Quickfix / Location list.

    -- Yank Quickfix List to clipboard register
    {
      "yq",
      function()
        local md = require("ctx").qflist_to_md()
        vim.fn.setreg("+", md)
        vim.notify("Yanked qflist")
      end,
      desc = "Yank Quickfix List",
    },
    -- Yank Location List to clipboard register
    {
      "yl",
      function()
        local nr = vim.api.nvim_get_current_win()
        local md = require("ctx").loclist_to_md(nr)
        vim.fn.setreg("+", md)
        vim.notify("Yanked loclist")
      end,
      desc = "Yank Quickfix List",
    },

    -- Suggestions for Quickfix List navigation
    { "[q", vim.cmd.cprev, desc = "Previous Quickfix item" },
    { "]q", vim.cmd.cnext, desc = "Next Quickfix item" },
    { "[Q", vim.cmd.colder, desc = "Older Quickfix list" },
    { "]Q", vim.cmd.cnewer, desc = "Newer Quickfix list" },
    -- Suggestions for Location List navigation
    { "[l", vim.cmd.lprev, desc = "Previous Location item" },
    { "]l", vim.cmd.lnext, desc = "Next Location item" },
    { "[L", vim.cmd.lolder, desc = "Older Location list" },
    { "]L", vim.cmd.lnewer, desc = "Newer Location list" },

  }
}
```

## 🚀 Usage

To get started with ctx.nvim, read the documentation with [`:help ctx`](https://github.com/S1M0N38/ctx.nvim/blob/main/doc/ctx.txt). This will provide you with a comprehensive overview of the plugin's features and usage.

> [!NOTE]
> **Learning Vim/Neovim Documentation**: Vim/Neovim plugins are usually shipped with :help documentation. Learning how to navigate it is a valuable skill. If you are not familiar with it, start with `:help` and read the first 20 lines.

## 🙏 Acknowledgments

- [tjdevries/vlog.nvim](https://github.com/tjdevries/vlog.nvim) for logging.
- [S1M0N38/base.nvim](https://github.com/S1M0N38/base.nvim) for template.

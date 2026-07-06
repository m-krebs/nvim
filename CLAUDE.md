# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using `vim.pack` (Neovim's built-in package manager) as the plugin manager. Requires Neovim >= 0.12.0.

## External Dependencies

- `git`, `make`, `unzip`, C compiler (`gcc`)
- `ripgrep` and `fd` (used by fzf-lua)
- `sk` (skim) — fzf-lua is configured to use `sk` as the fzf binary
- Nerd Font (optional, for icons)
- LSP/formatter tools are managed by Mason (`:Mason` inside Neovim)

## Architecture

### Entry Point

`init.lua` bootstraps everything in order:
1. Enables `vim.loader` for faster startup
2. Sets `mapleader = ' '` and `maplocalleader = ' '`
3. Defines `_G.gh(repo)` helper (returns `https://github.com/<repo>`)
4. Loads `_G.Utils` from `lua/utility/`
5. Loads `lua/core/options.lua`, `lua/core/colorscheme.lua`, `lua/core/keymaps.lua`, `lua/core/autocmds.lua`
6. Calls `require 'plugins'` which loads `lua/plugins/init.lua`

### Plugin Loading Pattern

Plugins are managed by `vim.pack` (no external plugin manager). Each plugin file:
1. Calls `vim.pack.add { gh 'author/repo', ... }` to register packages
2. Immediately calls `require('plugin').setup {}` for configuration

`lua/plugins/init.lua` explicitly `require`s each plugin file in order. There is no lazy-loading infrastructure — plugins load eagerly unless the plugin itself defers work.

The lock file is `nvim-pack-lock.json` at the repo root.

### Plugin Organization (`lua/plugins/`)

| File | Purpose |
|---|---|
| `init.lua` | Requires all other plugin files in order |
| `lsp/init.lua` | fidget, nvim-lspconfig, Mason, mason-lspconfig, mason-tool-installer, lazydev |
| `lsp/rust.lua` | rustaceanvim |
| `completion.lua` | blink.cmp (completion) |
| `editor.lua` | vim-sleuth, Comment.nvim, quicker.nvim, wayfinder, faster.nvim, flash.nvim |
| `navigation.lua` | fzf-lua (registered as `vim.ui.select`), todo-comments |
| `treesitter.lua` | nvim-treesitter + textobjects |
| `git.lua` | vim-fugitive, gitsigns.nvim, diffview.nvim |
| `ui.lua` | bufferline, lualine, nvim-notify, twilight, which-key, noice.nvim, ibl, marks.nvim, tiny-inline-diagnostic, tiny-glimmer |
| `dashboard.lua` | dashboard-nvim |
| `snacks.lua` | snacks.nvim (explorer, zen, scroll, lazygit) |
| `format.lua` | conform.nvim — formats on save; per-filetype formatters |
| `lint.lua` | nvim-lint — hadolint for Dockerfiles |
| `mini.lua` | mini.nvim modules |
| `toggleterm.lua` | Terminal integration |
| `overseer.lua` | overseer.nvim (task runner) |
| `kulala.lua` | kulala.nvim (HTTP REST client) |
| `misc.lua` | persistence.nvim, key-analyzer, nerdy.nvim, doing.nvim |
| `markdown.lua` | Markdown plugins |
| `utils.lua` | Miscellaneous utilities |

### Core Config (`lua/core/`)

| File | Purpose |
|---|---|
| `options.lua` | Neovim options |
| `keymaps.lua` | Global keymaps |
| `autocmds.lua` | Autocommands |
| `colorscheme.lua` | Colorscheme selection |
| `macros.lua` | Macro utilities |

### Global Utilities (`lua/utility/`)

Exposed globally as `_G.Utils` via a lazy-loading metatable. Submodules: `notify`, `terminal`, `wsl`. Access pattern: `Utils.notify.info(...)`, `Utils.terminal.*`, etc.

### LSP Setup Pattern

`lua/plugins/lsp/init.lua` uses `vim.lsp.config` + `vim.lsp.enable` directly (not lspconfig's `setup()`). LSP servers listed in the `servers` table are iterated and enabled via:
```lua
vim.lsp.config(name, server)
vim.lsp.enable(name)
```
Mason installs the tools; `mason-tool-installer` ensures they're present.

Rust is handled separately by rustaceanvim (`lua/plugins/lsp/rust.lua`).

LSP capabilities come from `blink.cmp` (`require('blink.cmp').get_lsp_capabilities()`), not nvim-cmp.

### Key Conventions

- `<leader>` = Space
- `<localleader>` = Space
- `jk` in insert mode → Escape
- fzf-lua is registered as `vim.ui.select`
- Diagnostics use `tiny-inline-diagnostic.nvim`; `virtual_text = false` globally
- Autoformat on save via conform.nvim; toggle with `<leader>uF` (global) or `<leader>uf` (buffer)
- `vim.g.disable_autoformat` / `vim.b[bufnr].disable_autoformat` control autoformat state

### Filetype Notes

- `.http` files → `http` filetype (kulala.nvim REST client)
- WSL detection (`Utils.wsl.is_wsl()`) disables clipboard sync on WSL

## Adding a Plugin

Add `vim.pack.add { gh 'author/repo' }` in the appropriate `lua/plugins/` file, then call `require('plugin').setup {}` immediately after. If creating a new file, add `require 'plugins.yourfile'` to `lua/plugins/init.lua`.

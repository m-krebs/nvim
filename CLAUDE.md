# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Requires Neovim >= 0.12.0.

## External Dependencies

- `git`, `make`, `unzip`, C compiler (`gcc`)
- `ripgrep` and `fd` (used by fzf-lua)
- `sk` (skim) — fzf-lua is configured to use `sk` as the fzf binary
- Nerd Font (optional, for icons)
- LSP/formatter tools are managed by Mason (`:Mason` inside Neovim)

## Architecture

### Entry Point

`init.lua` bootstraps everything in order:
1. Sets `mapleader = ' '` and `maplocalleader = '\\'`
2. Loads `_G.Utils` from `lua/utility/`
3. Loads `lua/config/options.lua`, `lua/config/keymaps.lua`, `lua/config/autocmds.lua`
4. Bootstraps lazy.nvim via `lua/config/lazy_setup.lua`, which imports all specs from `lua/plugins/`

### Plugin Organization (`lua/plugins/`)

Each file returns a lazy.nvim spec table. All files are auto-imported as `{ import = 'plugins' }`.

| File | Purpose |
|---|---|
| `init.lua` | Core: lazy.nvim pin, snacks.nvim (explorer, zen, scroll, lazygit) |
| `lsp/init.lua` | nvim-lspconfig + Mason + mason-lspconfig + rustaceanvim + powershell.nvim |
| `completion.lua` | blink.cmp (completion), copilot.lua |
| `editor.lua` | vim-sleuth, flash.nvim, fzf-lua, trouble.nvim, overseer.nvim, quicker.nvim |
| `format.lua` | conform.nvim — formats on save; per-filetype formatters |
| `lint.lua` | nvim-lint — hadolint for Dockerfiles |
| `treesitter.lua` | nvim-treesitter (main branch) + textobjects |
| `git.lua` | vim-fugitive, gitsigns.nvim, diffview.nvim |
| `ui.lua` | bufferline, lualine, nvim-notify, noice.nvim, dashboard, which-key, ibl, todo-comments, colorschemes |
| `misc.lua` | persistence.nvim (sessions), kulala.nvim (HTTP REST client), markdown plugins, lazydocker |
| `mini.lua` / `minipairs.lua` | mini.nvim modules |
| `toggleterm.lua` | Terminal integration |
| `debug.lua` | DAP debugging |
| `java.lua` | nvim-jdtls for Java LSP |
| `themes.lua` | Additional colorscheme(s) |
| `utils.lua` | Miscellaneous utilities |

### Global Utilities (`lua/utility/`)

Exposed globally as `_G.Utils` via a lazy-loading metatable. Submodules: `notify`, `terminal`, `telescope`, `wsl`. Access pattern: `Utils.notify.info(...)`, `Utils.terminal.*`, etc.

### LSP Setup Pattern

`lua/plugins/lsp/init.lua` uses an `opts.setup` table to skip `lspconfig` for certain servers:
- `jdtls` → handled by `nvim-jdtls` (`lua/plugins/java.lua`)
- `rust_analyzer` → handled by `rustaceanvim`

LSP capabilities come from `blink.cmp` (`require('blink.cmp').get_lsp_capabilities()`), not nvim-cmp.

### Key Conventions

- `<leader>` = Space
- `<localleader>` = `\`
- `jk` in insert mode → Escape
- fzf-lua is registered as `vim.ui.select`
- Diagnostics use `tiny-inline-diagnostic.nvim`; `virtual_text = false` globally
- Autoformat on save via conform.nvim; toggle with `<leader>uF` (global) or `<leader>uf` (buffer)
- `vim.g.disable_autoformat` / `vim.b[bufnr].disable_autoformat` control autoformat state

### Filetype Notes

- `.http` files → `http` filetype (kulala.nvim REST client)
- WSL detection (`Utils.wsl.is_wsl()`) disables clipboard sync on WSL

## Adding a Plugin

Create or edit a file in `lua/plugins/` returning a lazy.nvim spec. The file is auto-discovered. Follow the existing pattern: use `version = '*'` or a pinned semver, declare keys/cmd for lazy-loading, and put config in `opts` (table) or `config` (function) as appropriate.

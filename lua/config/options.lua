-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.cc = "80"

vim.g.vrc_set_default_mapping = 0
vim.g.vrc_response_default_content_type = "application/json"
vim.g.vrc_output_buffer_name = "_OUTPUT.json"
vim.g.vrc_auto_format_response_patterns = {
  json = "jq",
}

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- conceallevel for obsidian
vim.opt.conceallevel = 1

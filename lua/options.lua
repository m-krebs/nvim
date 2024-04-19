-- See `:help vim.opt or option-list`
local opt = vim.opt

opt.clipboard = 'unnamedplus' -- Sync with system clipboard
opt.confirm = true -- Confirm to save before exiting modified buffer
opt.cursorline = true -- Enable highlighting for the current line
opt.hlsearch = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.laststatus = 3
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.mouse = 'a' -- enable mouse mode
opt.number = true -- print line number
opt.relativenumber = true -- relative line number

opt.scrolloff = 4
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = 'screen'
opt.splitright = true

opt.tabstop = 2
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true -- Save undo history
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

vim.g.copilot_no_tab_map = true

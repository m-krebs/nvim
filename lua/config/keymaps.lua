local map = vim.keymap.set

--  See `:help vim.keymap.set()`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Editor
-- ctrl+backspace delete previous word
map('i', '<C-BS>', '<C-W>')
map('i', '<C-H>', '<C-W>')
map('i', 'jk', '<Esc>')

-- void
map('n', 'Q', '"_', { desc = 'Start void register' })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>cd', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- tabs
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First tab' })
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New tab' })
map('n', '<leader><tab>c', '<cmd>tabclose<cr>', { desc = 'Close tab' })
map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close other tabs' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous tab' })

-- windows `:help wincmd`
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
map('n', '<leader>wd', '<C-w>c', { desc = 'Close current window' })
map('n', '<leader>|', '<cmd>vsplit<cr>', { desc = 'Split window horizontally' })
map('n', '<leader>-', '<cmd>split<cr>', { desc = 'Split window vertically' })
map('n', '<leader>w|', '<cmd>vsplit<cr>', { desc = 'Split window horizontally' })
map('n', '<leader>w-', '<cmd>split<cr>', { desc = 'Split window vertically' })

-- buffers
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })

map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- terminal
-- map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Normal mode in terminal' })

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

require('plugins')
require('options')
require('keymaps')

vim.cmd([[
augroup Packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup END 
augroup FormatAutogroup
autocmd!
autocmd BufWritePost * FormatWrite
autocmd User FormatterPost lua print 'Formatted'
augroup END
]])

-- augroup fmt
-- autocmd!
-- autocmd BufWritePre * undojoin | Neoformat
-- augroup END

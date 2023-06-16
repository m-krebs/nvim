require('plugins')
require('keymaps')
require('options')

vim.cmd([[
augroup Packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END 
augroup FormatAutogroup
autocmd!
autocmd BufWritePost * FormatWrite
autocmd User FormatterPost lua print "Formatted"
augroup END
]])

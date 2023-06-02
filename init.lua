require('plugins')
require('me')

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


require('theme-config')
require('lualine-config')
require('bufferline-config')
require('iblank-config')

vim.cmd('colorscheme tokyonight')

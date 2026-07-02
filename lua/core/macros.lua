local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)

vim.fn.setreg('l', "yoconsole.log('" .. esc .. 'pa:' .. esc .. 'la, ' .. esc .. "pl'")

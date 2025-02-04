-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local function augroup(name)
  return vim.api.nvim_create_augroup('myvim_' .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

-- go to last loc when opening a buffer
autocmd('BufReadPost', {
  group = augroup 'last_loc',
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- highlight text when yanking | `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup 'highlight-yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- autocmd('User', {
--   pattern = 'LazyUpdate',
--   callback = function()
--     local repo_dir = '/home/mkrebs/.local/share/chezmoi/lib/external_nvim'
--     local lockfile = repo_dir .. '/lazy-lock.json'
--
--     local cmd = {
--       'git',
--       '-C',
--       repo_dir,
--       'commit',
--       lockfile,
--       '-m',
--       '[auto] Update lazy-lock.json',
--     }
--
--     local success, process = pcall(function()
--       return vim.system(cmd):wait()
--     end)
--
--     if process and process.code == 0 then
--       vim.notify 'Commited lazy-lock.json'
--       vim.notify(process.stdout)
--     else
--       if not success then
--         vim.notify("Failed to run command '" .. table.concat(cmd, ' ') .. "':", vim.log.levels.WARN, {})
--         vim.notify(tostring(process), vim.log.levels.WARN, {})
--       else
--         vim.notify 'git ran but failed to commit:'
--         vim.notify(process.stdout, vim.log.levels.WARN, {})
--       end
--     end
--   end,
-- })

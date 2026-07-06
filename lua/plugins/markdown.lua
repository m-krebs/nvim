vim.pack.add {
  gh 'MeanderingProgrammer/render-markdown.nvim',
  gh 'iamcco/markdown-preview.nvim',
}

local hook = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'markdown-preview' and (kind == 'install' or kind == 'update') then
    -- vim.opt.rtp:prepend(vim.fn.stdpath 'data' .. '/lazy/markdown-preview.nvim')
    vim.fn['mkdp#util#install']()
  end
end

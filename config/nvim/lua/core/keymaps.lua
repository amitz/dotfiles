vim.keymap.set('n', '<leader>-', '<Cmd>wincmd _<CR><Cmd>wincmd |<CR>', { desc = 'Zoom window' })
vim.keymap.set('n', '<leader>=', '<Cmd>wincmd =<CR>', { desc = 'Equalize windows' })

-- Move by screen lines in wrapped text; counts (5j) still move by real lines.
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Line diagnostics in a float, cursor moved into it so it can be scrolled/copied.
vim.keymap.set('n', '<leader>q', function()
  local _, winid = vim.diagnostic.open_float { scope = 'line' }
  if winid then
    vim.api.nvim_set_current_win(winid)
    vim.keymap.set('n', '<Esc>', '<Cmd>close<CR>', { buffer = true, silent = true })
  end
end, { desc = 'Show line diagnostics' })

vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

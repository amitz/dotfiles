vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Rebalance splits when the terminal is resized',
  group = vim.api.nvim_create_augroup('rebalance-window-splits', { clear = true }),
  command = 'wincmd =',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Briefly highlight yanked text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

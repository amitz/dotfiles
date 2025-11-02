-- Automatically rebalance window splits when the terminal is resized
vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('rebalance-window-splits', { clear = true }),
  pattern = '*',
  command = 'wincmd =',
  desc = 'Resize splits on window resize',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

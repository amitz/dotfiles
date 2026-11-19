-- Popup of pending keys: press <leader> and wait. https://github.com/folke/which-key.nvim
vim.pack.add { 'https://github.com/folke/which-key.nvim' }

require('which-key').setup {
  delay = 1000, -- ms; stays out of the way when you know the key
  spec = {
    { '<leader>s', group = '[S]earch' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { '<leader>g', group = '[G]it diff (diffview)', mode = { 'n', 'v' } },
    { '<leader>c', group = 'Merge [C]onflict (in diffview)' },
    { 'gr', group = 'LSP' },
  },
}

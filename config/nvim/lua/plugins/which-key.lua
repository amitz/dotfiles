return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 1000,
    spec = {
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  }
}

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha',
      integrations = {
        fidget = true,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)

      -- Set the colorscheme
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}

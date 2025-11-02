-- Create an alias for :W to function exactly like :w - as I often click big
-- W instead of instead w
vim.api.nvim_create_user_command(
  'W',
  'write <args>',
  {
    nargs = '*',
    desc = 'Alias for :write',
  }
)

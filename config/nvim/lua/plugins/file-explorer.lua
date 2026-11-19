-- File explorer: edit folders like a buffer, :w applies. https://github.com/stevearc/oil.nvim
vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  delete_to_trash = true,
  view_options = { show_hidden = true },
  float = { max_width = 0.6, max_height = 0.7 },
}

vim.keymap.set('n', '\\', function() require('oil').toggle_float() end, { desc = 'File explorer (oil)' })

-- Statusline: https://github.com/nvim-lualine/lualine.nvim
-- Icons come from mini.icons (editing.lua) through its nvim-web-devicons mock.
vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

require('lualine').setup {
  options = { theme = 'catppuccin-nvim' },
  sections = {
    -- Default right side plus the buffer's LSP servers (spinner while loading).
    lualine_x = { 'lsp_status', 'encoding', 'fileformat', 'filetype' },
  },
}

-- Catppuccin Mocha, matching Ghostty, tmux, fzf and the zsh prompt.
-- https://github.com/catppuccin/nvim
-- Plugin integrations are detected automatically (auto_integrations).
vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup { flavour = 'mocha' }
vim.cmd.colorscheme 'catppuccin'

-- C-h/j/k/l across Neovim splits and tmux panes. https://github.com/christoomey/vim-tmux-navigator
-- The tmux half is the same plugin in config/tmux/tmux.conf.

-- Read when the plugin loads, so set before vim.pack.add.
vim.g.tmux_navigator_no_mappings = 1 -- only the four maps below (no C-\, as in tmux)
vim.g.tmux_navigator_disable_when_zoomed = 1 -- matches tmux.conf

vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }

vim.keymap.set('n', '<C-h>', '<Cmd>TmuxNavigateLeft<CR>', { desc = 'Navigate left (split or tmux pane)' })
vim.keymap.set('n', '<C-j>', '<Cmd>TmuxNavigateDown<CR>', { desc = 'Navigate down (split or tmux pane)' })
vim.keymap.set('n', '<C-k>', '<Cmd>TmuxNavigateUp<CR>', { desc = 'Navigate up (split or tmux pane)' })
vim.keymap.set('n', '<C-l>', '<Cmd>TmuxNavigateRight<CR>', { desc = 'Navigate right (split or tmux pane)' })

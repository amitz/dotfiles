-- :W = :w (typo guard), with ! and file completion.
vim.api.nvim_create_user_command('W', 'write<bang> <args>', { bang = true, nargs = '*', complete = 'file', desc = 'Alias for :write' })

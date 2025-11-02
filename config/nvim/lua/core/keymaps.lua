-- Maximize the current window split
vim.keymap.set('n', '<leader>-', '<Cmd>wincmd _<CR><Cmd>wincmd |<CR>', { desc = 'Zoom window' })

-- Make all window splits equal size
vim.keymap.set('n', '<leader>=', '<Cmd>wincmd =<CR>', { desc = 'Equalize windows' })

-- Toggle between the current and previous buffer 
-- TODO: Trying to get a list of buffer instead using telescope
-- vim.keymap.set('n', '<leader><leader>', '<C-^>', { desc = 'Switch to last buffer' })

-- Make 'Y' yank to the end of the line, consistent with 'D' and 'C'
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- Move up/down by visual lines in wrapped text
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Create a new tab
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })

-- Close the current tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {
  desc = 'Clear search highlights',
})

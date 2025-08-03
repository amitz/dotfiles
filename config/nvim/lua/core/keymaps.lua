-- Maximize the current window split
vim.keymap.set("n", "<leader>-", "<Cmd>wincmd _<CR><Cmd>wincmd |<CR>", { desc = "Zoom window" })
-- Make all window splits equal size
vim.keymap.set("n", "<leader>=", "<Cmd>wincmd =<CR>", { desc = "Equalize windows" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  desc = "Clear search highlights",
})

-- Navigate command-line history with Ctrl-j/k
vim.keymap.set("c", "<C-k>", "<Up>", { desc = "Previous command in history" })
vim.keymap.set("c", "<C-j>", "<Down>", { desc = "Next command in history" })

-- Toggle between the current and previous buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Switch to last buffer" })

-- Make 'Y' yank to the end of the line, consistent with 'D' and 'C'
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Move up/down by visual lines in wrapped text
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Bring up the substitute command with the previous search pattern
vim.keymap.set("n", "<leader>s", ":%s///g<Left><Left>", { desc = "Substitute previous search" })
vim.keymap.set("v", "<leader>s", ":s///g<Left><Left>", { desc = "Substitute selection" })

-- Create a new tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })

-- Close the current tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to Next Diagnostic" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to Previous Diagnostic" })

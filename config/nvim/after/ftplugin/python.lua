-- Settings for Python
vim.bo.expandtab = true
vim.bo.tabstop = 4

-- Buffer-local keymaps for debugging
local opts = { buffer = true, desc = "Python debugging" }
vim.keymap.set("n", "<leader>ip", "ofrom IPython import embed; embed()<esc>", opts)
vim.keymap.set("n", "<leader>pdb", "oimport ipdb; ipdb.set_trace(context=5)<esc>", opts)
vim.keymap.set("n", "<leader>slp", "oimport time; time.sleep(1)<esc>", opts)

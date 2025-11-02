-- Settings for Typescript
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

-- Debugging keymap
vim.keymap.set("n", "<leader>slp", "oAtomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, 1000);<esc>", { buffer = true, desc = "JS sleep" })

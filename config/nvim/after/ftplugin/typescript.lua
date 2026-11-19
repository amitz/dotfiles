-- TypeScript (.ts only; .tsx is filetype typescriptreact, which doesn't load this file)
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

-- Debugging helper: block for 1 second
vim.keymap.set('n', '<leader>slp', 'oAtomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, 1000);<Esc>', { buffer = true, desc = 'Insert sleep(1s)' })

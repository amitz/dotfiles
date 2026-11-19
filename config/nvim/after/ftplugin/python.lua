-- Python (indent: nvim's default is already 4 spaces)

-- Debugging helper (use the built-in breakpoint() to stop in the debugger)
vim.keymap.set('n', '<leader>slp', 'oimport time; time.sleep(1)<Esc>', { buffer = true, desc = 'Insert sleep(1)' })

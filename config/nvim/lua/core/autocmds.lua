-- Create a group for my custom autocommands to avoid duplicates
local custom_autocmds = vim.api.nvim_create_augroup("CustomAutocmds", { clear = true })

-- Automatically rebalance window splits when the terminal is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = custom_autocmds,
  pattern = "*",
  command = "wincmd =",
  desc = "Resize splits on window resize",
})

-- Autocommand to restore cursor position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = custom_autocmds,
  pattern = "*",
  desc = "Restore cursor to last known position",
  callback = function()
    local last_pos = vim.api.nvim_buf_get_mark(0, '"')
    local last_line = last_pos[1]
    local line_count = vim.api.nvim_buf_line_count(0)

    if vim.bo.filetype ~= "gitcommit" and last_line > 0 and last_line <= line_count then
      vim.api.nvim_win_set_cursor(0, last_pos)
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = custom_autocmds,
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
  end,
})

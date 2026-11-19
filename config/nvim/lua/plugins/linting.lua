-- Linters that aren't LSP servers; results show as diagnostics.
-- https://github.com/mfussenegger/nvim-lint
vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }

local lint = require 'lint'

lint.linters_by_ft = {
  dockerfile = { 'hadolint' },
  groovy = { 'npm-groovy-lint' },
}

-- Rules in ~/.config/groovylint (config/groovylint); keeps nvim-lint's default args.
local groovy = lint.linters['npm-groovy-lint']
groovy.args = vim.list_extend({ '--config', vim.fs.joinpath(vim.env.XDG_CONFIG_HOME or vim.fn.expand '~/.config', 'groovylint/groovylintrc.json') }, groovy.args)

-- nvim-lint's recommended trigger: on open and after each save.
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
  group = vim.api.nvim_create_augroup('lint', { clear = true }),
  callback = function()
    if vim.bo.modifiable then lint.try_lint() end -- skip help, LSP hover, ...
  end,
})

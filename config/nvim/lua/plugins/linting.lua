-- This lint the buffer and display results as diagnostics

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    local groovy = lint.linters['npm-groovy-lint']
    groovy.args = {
      '--config=' .. os.getenv 'HOME' .. '/.groovylintrc.json',
    }
    groovy.ignore_exitcode = true

    lint.linters_by_ft = {
      groovy = { 'npm-groovy-lint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers that you can modify in order to
        -- avoid superfluous noise, notably within the handy LSP pop-ups that
        -- describe the hovered symbol using Markdown.
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })
  end,
}

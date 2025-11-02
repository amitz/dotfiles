-- Formats the buffer

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<F8>',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F8]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    formatters = {
      ['npm-groovy-lint'] = {
        command = 'npm-groovy-lint',
        args = { '--config=' .. os.getenv 'HOME' .. '/.groovylintrc.json', '--fix', '$FILENAME' },
        stdin = false,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      groovy = { 'npm-groovy-lint' },
      typescript = { 'eslint_d' },
    },
  },
}

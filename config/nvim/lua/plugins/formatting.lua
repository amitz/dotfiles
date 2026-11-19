-- Formatting on demand (<F8>). Diagnostics are in linting.lua and the LSP servers.
-- https://github.com/stevearc/conform.nvim
vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  -- No formatter listed (or none available) -> the LSP's formatter (YAML -> yamlls).
  default_format_opts = { lsp_format = 'fallback' },
  formatters_by_ft = {
    lua = { 'stylua' }, -- config: config/nvim/.stylua.toml
    -- Safe lint fixes, then import sorting, then layout (project's ruff config)
    python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
    -- Prettier for layout, then the eslint LSP for rule fixes. Without a
    -- Prettier config only eslint runs. vtsls formatting is off (after/lsp/vtsls.lua).
    typescript = { 'prettierd', lsp_format = 'last' },
    json = { 'prettierd' }, -- no Prettier config -> jsonls
    jsonc = { 'prettierd' },
    groovy = { 'npm-groovy-lint' },
  },
  formatters = {
    prettierd = { require_cwd = true }, -- only in projects with a Prettier config
    -- Rules in ~/.config/groovylint (config/groovylint)
    ['npm-groovy-lint'] = { prepend_args = { '--config', vim.fs.joinpath(vim.env.XDG_CONFIG_HOME or vim.fn.expand '~/.config', 'groovylint/groovylintrc.json') } },
  },
}

vim.keymap.set({ 'n', 'x' }, '<F8>', function() require('conform').format { async = true } end, { desc = '[F8] Format buffer (or selection)' })

-- LSP: server configs from nvim-lspconfig, installed by Mason.
-- Per-server settings: after/lsp/<server>.lua (merged over lspconfig's defaults).
vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/b0o/SchemaStore.nvim', -- schemas for jsonls and yamlls
  'https://github.com/folke/lazydev.nvim', -- Neovim API types for lua_ls
}

require('lazydev').setup { library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } } }

-- Servers to enable (lspconfig names). Comment one out to disable it.
local servers = {
  'vtsls', -- TypeScript
  'eslint', -- ESLint diagnostics + fixes for TS/JS
  'pyright', -- Python types, hover, go-to
  'ruff', -- Python lint + format
  'jsonls', -- JSON (package.json, tsconfig, ... via SchemaStore)
  'yamlls', -- YAML (.gitlab-ci.yml, compose, ... via SchemaStore)
  'dockerls', -- Dockerfile
  'lua_ls', -- Lua
}

-- mason-lspconfig only maps names (lua_ls -> lua-language-server); we enable servers ourselves.
require('mason').setup()
require('mason-lspconfig').setup { automatic_enable = false }
require('mason-tool-installer').setup {
  ensure_installed = vim.list_extend(vim.deepcopy(servers), {
    'stylua', -- formatting.lua
    'prettierd', -- formatting.lua
    'hadolint', -- linting.lua
    'npm-groovy-lint', -- formatting.lua, linting.lua
  }),
}

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc }) end

    -- Lists open in fzf-lua instead of the quickfix list (Neovim's defaults stay if picker.lua is disabled).
    local ok, fzf = pcall(require, 'fzf-lua')
    if ok then
      map('grr', fzf.lsp_references, '[G]oto [R]eferences')
      map('gri', fzf.lsp_implementations, '[G]oto [I]mplementation')
      map('grt', fzf.lsp_typedefs, '[G]oto [T]ype definition')
      map('gO', fzf.lsp_document_symbols, 'Document symbols')
      map('gW', fzf.lsp_live_workspace_symbols, 'Workspace symbols')
    end
    map('grd', ok and fzf.lsp_definitions or vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- Highlight other uses of the word under the cursor after a pause (updatetime)
    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local group = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { buffer = event.buf, group = group, callback = vim.lsp.buf.document_highlight })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, { buffer = event.buf, group = group, callback = vim.lsp.buf.clear_references })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle inlay [H]ints')
    end
  end,
})

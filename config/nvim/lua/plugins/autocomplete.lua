-- Completion: https://github.com/saghen/blink.cmp (v1; main is the unreleased v2)
-- Also gives every LSP server its completion capabilities (automatically).
vim.pack.add { { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' } }

require('blink.cmp').setup {
  keymap = {
    preset = 'default',
    -- macOS takes <C-space> (input language), so docs get <C-d>. Falls back
    -- to the built-in <C-d> (dedent) when the menu is closed.
    ['<C-d>'] = { 'show_documentation', 'hide_documentation', 'fallback' },
  },
  sources = {
    default = { 'lsp', 'path', 'buffer', 'lazydev' },
    providers = {
      -- Neovim Lua API, only active in Lua files (lsp.lua sets up lazydev)
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },
  signature = { enabled = true },
}

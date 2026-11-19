-- Lua (mostly this nvim config). Neovim API types come from lazydev (lsp.lua).
return {
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

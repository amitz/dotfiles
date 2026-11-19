-- Treesitter parsers, highlighting and indent: https://github.com/nvim-treesitter/nvim-treesitter
-- Needs tree-sitter-cli (Brewfile). Parsers update with the plugin (PackChanged in init.lua).
vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
  -- Only its queries are used: function/class textobjects in editing.lua (mini.ai)
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
}

-- No-op once installed. Bundled with nvim already: c, lua, markdown, query, vim, vimdoc.
require('nvim-treesitter').install {
  'bash',
  'diff',
  'dockerfile',
  'git_config',
  'gitcommit',
  'groovy',
  'html',
  'json',
  'python',
  'typescript',
  'yaml',
}

-- Start treesitter for any filetype that has a parser; others keep regex highlighting.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then return end
    local lang = vim.treesitter.language.get_lang(args.match)
    if lang and vim.treesitter.query.get(lang, 'indents') then vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
  end,
})

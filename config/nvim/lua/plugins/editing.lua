-- Indent detection: https://github.com/NMAC427/guess-indent.nvim
-- Triggered on FileType (after after/ftplugin/*) instead of the plugin's
-- BufReadPost, so an existing file's real indent wins over the ftplugin
-- default; the ftplugin then only applies to new/empty files.
-- Files with .editorconfig are left to editorconfig.
vim.pack.add { 'https://github.com/NMAC427/guess-indent.nvim' }
require('guess-indent').setup { auto_cmd = false }
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('guess-indent-after-ftplugin', { clear = true }),
  callback = function(args) require('guess-indent').set_from_buffer(args.buf, true, true) end,
})

-- mini.nvim: https://github.com/nvim-mini/mini.nvim
vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

-- Icons (Ghostty ships Nerd Font symbols). The mock lets plugins that expect
-- nvim-web-devicons (lualine) use mini.icons instead.
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

-- Auto-close brackets and quotes.
require('mini.pairs').setup()

-- Highlight TODO / FIXME / HACK / NOTE as whole words (anywhere, not only in comments).
require('mini.hipatterns').setup {
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
  },
}

-- Extra around/inside textobjects.
local ai = require 'mini.ai'
ai.setup {
  -- an/in stay with Neovim's built-in incremental selection
  mappings = { around_next = 'aN', inside_next = 'iN', around_last = 'aL', inside_last = 'iL' },
  custom_textobjects = {
    -- Queries from nvim-treesitter-textobjects (none for Groovy)
    F = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
    c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
    -- Entire buffer
    e = function()
      local last_line = vim.fn.line '$'
      local last_col = math.max(vim.fn.col { last_line, '$' } - 1, 1)
      return { from = { line = 1, col = 1 }, to = { line = last_line, col = last_col } }
    end,
  },
}

require('mini.surround').setup()

-- Only replace-with-register and sort.
require('mini.operators').setup {
  replace = { prefix = 'cr' }, -- not `gr`: keeps Neovim's gr* LSP maps
  exchange = { prefix = '' }, -- off: keeps `gx` = open URL/file
  multiply = { prefix = '' },
  evaluate = { prefix = '' },
}

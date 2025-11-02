return {
  -- Fast indentation style detection for Neovim written in Lua, no more
  -- Ftplugins.
  { 'NMAC427/guess-indent.nvim', opts = {} },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Mini.ai, comment, surround, replace modules
  {
    'nvim-mini/mini.nvim',
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup({
        custom_textobjects = {
          -- "Entire Buffer" text-object. For example, `dae` will [D] [A]n [E]ntire buffer
          e = function()
            local from = { line = 1, col = 1 }
            local last_line = vim.fn.line '$'
            local last_col = math.max(vim.fn.col { last_line, '$' } - 1, 1)
            return { from = from, to = { line = last_line, col = last_col } }
          end,
        }
      })

      require('mini.comment').setup()
      require('mini.surround').setup()
      require('mini.operators').setup() -- Mainly for replace with register
    end,
  },

  -- Sort motion
  {
    'sQVe/sort.nvim',
    config = function()
      require('sort').setup {
        mappings = {
          operator = 'gs', -- This changes the operator to 'gs'
        },
      }
    end,
  },
}

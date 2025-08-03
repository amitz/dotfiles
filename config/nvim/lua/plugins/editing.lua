return {
  -- Treesitter for syntax-aware text objects
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "comment", "python", "typescript" },
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["al"] = "@line.outer",
              ["il"] = "@line.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
      })
    end,
  },

  -- Mini.ai, comment, surround, replace modules
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup({
        custom_textobjects = {
          e = function()
            local from = { line = 1, col = 1 }
            local last_line = vim.fn.line("$")
            local last_col = math.max(vim.fn.col({ last_line, "$" }) - 1, 1)
            return { from = from, to = { line = last_line, col = last_col } }
          end,
        },
      })

      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.operators").setup() -- Mainly for replace with register
    end,
  },

  -- Sort motion
  {
    'sQVe/sort.nvim',
    config = function()
      require('sort').setup({
        mappings = {
          operator = 'gs', -- This changes the operator to 'gs'
        },
      })
    end,
  }
}

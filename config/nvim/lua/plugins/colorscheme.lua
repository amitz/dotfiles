return {
  -- Default theme: Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          telescope = true,
	  treesitter = true,
          nvimtree = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
              ok = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
              ok = { "underline" },
            },
             inlay_hints = {
             background = true,
            },
          },
          mini = {
            enabled = true,
            indentscope_color = "",
	  },
        },
      })
      -- Set the default colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Alternative theme: Solarized8
  {
    "lifepillar/vim-solarized8",
    priority = 1000,
    branch = "neovim",
    config = function()
      -- Pre-configure the theme, but do not apply it
      vim.g.solarized_variant = "dark"

      -- Disable underline under line number, make CursorLineNr bold yellow
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "Yellow", bold = true })

      -- Customize the search highlight style
      vim.api.nvim_set_hl(0, "Search", {
        fg = "#d78700", -- Example gold/orange
        bg = "NONE",
        bold = true,
        underline = true,
      })
    end,
  },
}

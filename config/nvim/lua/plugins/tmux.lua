return {
  "alexghergh/nvim-tmux-navigation",
  keys = {
    {
      "<C-h>",
      function() require("nvim-tmux-navigation").NvimTmuxNavigateLeft() end,
      desc = "Navigate left to Tmux pane",
    },
    {
      "<C-j>",
      function() require("nvim-tmux-navigation").NvimTmuxNavigateDown() end,
      desc = "Navigate down to Tmux pane",
    },
    {
      "<C-k>",
      function() require("nvim-tmux-navigation").NvimTmuxNavigateUp() end,
      desc = "Navigate up to Tmux pane",
    },
    {
      "<C-l>",
      function() require("nvim-tmux-navigation").NvimTmuxNavigateRight() end,
      desc = "Navigate right to Tmux pane",
    },
  },
  opts = {
    disable_when_zoomed = true
  }
}


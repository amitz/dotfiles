return {
  {
    -- Git blame
    "FabijanZulj/blame.nvim",
    config = function()
      require('blame').setup {}
    end,
    keys = {
      {
        "<leader>gb",
        "<cmd>BlameToggle<CR>",
        desc = "Toggle Git Blame",
        mode = "n",
      },
    },
  },
}

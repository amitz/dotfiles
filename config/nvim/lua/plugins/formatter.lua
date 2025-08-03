return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        groovy = { "npm-groovy-lint" },
	typescript = { "eslint_d" },
      },
    })
    formatters = {
       ["npm-groovy-lint"] = {
         command = "npm-groovy-lint",
         args = { "--config=/Users/azarfati/.groovylintrc.json", "--fix", "$FILENAME" },
         stdin = false,
       },
    },

    -- Map F8 to format the buffer
    vim.keymap.set({ "n", "v" }, "<F8>", function()
      require("conform").format({ async = true })
    end, { desc = "Format buffer" })
  end,
}

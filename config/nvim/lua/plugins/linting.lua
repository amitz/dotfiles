-- nvim-lint is only used as Canform doesn't support npm-groovy-lint
return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    local groovy = lint.linters["npm-groovy-lint"]
    groovy.args =  {
      "--config=" .. os.getenv('HOME') .. "/.groovylintrc.json",
    }
    groovy.ignore_exitcode = true

    lint.linters_by_ft = {
      groovy = { "npm-groovy-lint" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

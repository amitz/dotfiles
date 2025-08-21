return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSPs
          "typescript-language-server",
          "eslint",
          "pyright",
          "dockerls",
          "yamlls",
          -- Linters/Formatters
          "eslint_d",
          "stylua",
          "npm-groovy-lint",
        },
        run_on_start = true, -- Installs tools on startup
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local on_attach = function(client, bufnr)
        if client.server_capabilities.semanticTokensProvider then
          -- As I'm using TreeSplitter highlight, I'm shutting this down
          -- client.server_capabilities.semanticTokensProvider = nil
        end

        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("K", vim.lsp.buf.hover, "Hover Documentation")

      end

      local lspconfig = require("lspconfig")

      lspconfig.ts_ls.setup({
        on_attach = on_attach,
      })

      lspconfig.eslint.setup({
        on_attach = on_attach,
      })

      lspconfig.pyright.setup({
        on_attach = on_attach,
      })

      lspconfig.dockerls.setup({
        on_attach = on_attach,
      })

      lspconfig.yamlls.setup({
        on_attach = on_attach,
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose*.yml",
            },
          },
        },
      })
    end,
  },
}

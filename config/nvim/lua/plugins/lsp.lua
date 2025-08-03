return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local on_attach = function(client, bufnr)
       if client.server_capabilities.semanticTokensProvider then
	  -- As I'm using TreeSplitter highlight, I'm shutting this down
          client.server_capabilities.semanticTokensProvider = nil
        end
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
        end

        nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
        nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        nmap("gd", vim.lsp.buf.definition, "Go to Definition")
        nmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
        nmap("gr", vim.lsp.buf.references, "Go to References")
        nmap("gi", vim.lsp.buf.implementation, "Go to Implementation")
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      end

      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = {
          "ts_ls",
          "eslint",
          "pyright",
          "dockerls",
          "yamlls",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
            })
          end,

          yamlls = function()
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
      })
    end,
  }
}

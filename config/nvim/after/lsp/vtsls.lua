-- TypeScript server without formatting: the eslint LSP formats TS/JS instead.
return {
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}

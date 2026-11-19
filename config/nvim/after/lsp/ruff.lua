-- Python lint + format only; pyright provides hover (ruff docs recommendation).
return {
  on_attach = function(client) client.server_capabilities.hoverProvider = false end,
}

-- When you type an opening character like (, {, [, ", ', or `, the plugin automatically inserts the corresponding closing character

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
}

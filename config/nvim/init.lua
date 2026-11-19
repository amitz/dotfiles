vim.loader.enable()

-- Leader must be set before plugins load, or their mappings use the wrong one.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'core.options'
require 'core.keymaps'
require 'core.autocmds'
require 'core.commands'

-- Plugin build steps. Registered before the first vim.pack.add() so it also
-- fires when a new machine installs from the lockfile. See :help vim.pack-events
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    -- Parsers must match the plugin version, so update them with it.
    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
    end
  end,
})

-- Plugins: each file calls vim.pack.add() then setup(). See :help vim.pack
-- Versions are pinned in nvim-pack-lock.json. Commands are in CHEATSHEET.md.
-- Order: colorscheme first (later plugins read its colors), completion
-- before LSP (servers get its capabilities).
require 'plugins.colorscheme'
require 'plugins.treesitter'
require 'plugins.editing'
require 'plugins.autocomplete'
require 'plugins.lsp'
require 'plugins.formatting'
require 'plugins.linting'
require 'plugins.picker'
require 'plugins.file-explorer'
require 'plugins.git'
require 'plugins.statusline'
require 'plugins.navigation'
require 'plugins.which-key'

-- Fuzzy picker on the fzf binary: https://github.com/ibhagwan/fzf-lua
-- Colors and layout come from config/fzf/fzfrc ($FZF_DEFAULT_OPTS_FILE).
vim.pack.add { 'https://github.com/ibhagwan/fzf-lua' }

local fzf = require 'fzf-lua'
fzf.setup {
  fzf_opts = { ['--no-popup'] = true }, -- fzfrc's --popup is for the shell; open inside nvim
  -- fzf-lua clears RIPGREP_CONFIG_PATH unless set here; keep the shell's rg config
  grep = { RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH },
}
fzf.register_ui_select() -- vim.ui.select (code actions, ...) uses fzf-lua

vim.keymap.set('n', '<leader>sh', fzf.helptags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect picker' })
vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
vim.keymap.set('x', '<leader>sw', fzf.grep_visual, { desc = '[S]earch selection' })
vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics (file)' })
vim.keymap.set('n', '<leader>sr', fzf.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', fzf.oldfiles, { desc = '[S]earch recent files' })
vim.keymap.set('n', '<leader>sc', fzf.commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', fzf.blines, { desc = '[/] Search in current buffer' })
vim.keymap.set('n', '<leader>s/', fzf.lines, { desc = '[S]earch [/] in open buffers' })
vim.keymap.set('n', '<leader>sn', function() fzf.files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [N]eovim files' })

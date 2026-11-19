---@diagnostic disable: param-type-mismatch

-- [[ gitsigns: signs in the gutter + hunk actions ]]
-- https://github.com/lewis6991/gitsigns.nvim
vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'
    local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc }) end

    -- Navigation (in diff mode, keep Vim's own ]c / [c)
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, 'Next git [c]hange')
    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, 'Previous git [c]hange')

    -- Hunk actions (stage_hunk on an already staged hunk unstages it)
    map('x', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, 'Git [s]tage/unstage selection')
    map('x', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, 'Git [r]eset selection')
    map('n', '<leader>hs', gitsigns.stage_hunk, 'Git [s]tage/unstage hunk')
    map('n', '<leader>hr', gitsigns.reset_hunk, 'Git [r]eset hunk')
    map('n', '<leader>hS', gitsigns.stage_buffer, 'Git [S]tage buffer')
    map('n', '<leader>hR', gitsigns.reset_buffer, 'Git [R]eset buffer')
    map('n', '<leader>hp', gitsigns.preview_hunk, 'Git [p]review hunk')
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, 'Git preview hunk [i]nline')
    map('n', '<leader>hb', gitsigns.blame, 'Git [b]lame (whole file)')
    map('n', '<leader>hd', gitsigns.diffthis, 'Git [d]iff against index')
    map('n', '<leader>hD', function() gitsigns.diffthis '@' end, 'Git [D]iff against last commit')
    map('n', '<leader>hq', gitsigns.setqflist, 'Git hunks to [q]uickfix (this file)')
    map('n', '<leader>hQ', function() gitsigns.setqflist 'all' end, 'Git hunks to [Q]uickfix (whole repo)')

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, '[T]oggle git [b]lame line')
    map('n', '<leader>tw', gitsigns.toggle_word_diff, '[T]oggle git [w]ord diff')

    -- Text object: vih / dih / yih
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'Inside git hunk')
  end,
}

-- [[ diffview: diff / history / merge-conflict UI in tabs ]]
-- diffview+ (maintained fork of sindrets/diffview.nvim): https://github.com/dlyongemallo/diffview-plus.nvim
-- Merge-view keys (]x, <leader>co/ct/cb/ca, dx) are diffview defaults; see CHEATSHEET.md.
vim.pack.add { 'https://github.com/dlyongemallo/diffview-plus.nvim' }

require('diffview').setup {
  enhanced_diff_hl = true, -- better colors for changed text within a line
  view = {
    merge_tool = { layout = 'diff3_mixed' }, -- ours | theirs on top, result below
  },
}

vim.keymap.set('n', '<leader>gd', '<Cmd>DiffviewOpen<CR>', { desc = 'Git [d]iff working tree (or conflicts)' })
vim.keymap.set('n', '<leader>gm', '<Cmd>DiffviewOpen origin/HEAD...HEAD<CR>', { desc = 'Git diff vs [m]ain (what the MR will show)' })
vim.keymap.set('n', '<leader>gh', '<Cmd>DiffviewFileHistory %<CR>', { desc = 'Git [h]istory of current file' })
vim.keymap.set('n', '<leader>gH', '<Cmd>DiffviewFileHistory<CR>', { desc = 'Git [H]istory of branch' })
vim.keymap.set('x', '<leader>gh', ':DiffviewFileHistory<CR>', { desc = 'Git [h]istory of selected lines' })
vim.keymap.set('n', '<leader>gq', '<Cmd>DiffviewClose<CR>', { desc = 'Git diff [q]uit' })

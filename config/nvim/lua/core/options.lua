-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Make line numbers default
vim.opt.number = true

-- Also add relative line numbers, for easier jumping
vim.opt.relativenumber = true

-- Keep signcolumn (also known as gutter) on by default
vim.opt.signcolumn = 'yes'

-- Enable mouse support (useful for scrolling, resizing)
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent. The wrapped portion is indented to align with the line it belongs to, preserving the visual block structure.
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show a live preview of substitution commands
vim.opt.inccommand = 'split'

-- Sets the delay (in ms) for triggering the 'CursorHold' event, used by many plugins.
vim.opt.updatetime = 250

-- Sets the time (in ms) to wait for the next key in a multi-key command.
vim.opt.timeoutlen = 300

-- Enhance command-line completion
vim.opt.wildmode = 'list:longest,full'

-- Configure how new windows should be opened
vim.opt.splitright = true -- Open new vertical splits to the right
vim.opt.splitbelow = true -- Open new horizontal splits below

-- Keep a few lines of context around the cursor
vim.opt.scrolloff = 10

-- Do not enable code folding by default
vim.opt.foldenable = false

-- Disable swap/backup files, but enable persistent undo history
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Persist undo history across sessions by storing it in a dedicated directory
local undodir = vim.fn.stdpath 'cache' .. '/undo'
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- Highlight the line the cursor is on
vim.opt.cursorline = true

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  nbsp = '␣', -- Character for non-breaking space
  trail = '·', -- Trailing space
}

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`), instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Configure how diagnostics are displayed
vim.diagnostic.config {
  -- Add a border to the diagnostic float window
  float = {
    source = 'if_many',
    border = 'rounded',
  },
  -- Use icons for signs in the gutter (requires a Nerd Font)
  signs = {
    active = true,
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  -- Show errors inline
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}

-- Set a fixed text width for formatting and visual guidance
vim.opt.textwidth = 80
-- vim.opt.colorcolumn = '+1' -- Highlight the column just after the text width

-- TODO: I'm not sure I need it anymore. For now I'm commenting it to see how
-- neovim works without it

-- Redraw only when necessary
-- vim.opt.lazyredraw = true

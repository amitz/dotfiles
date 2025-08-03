-- Make line numbers default
vim.opt.number = true
-- Also add relative line numbers, for easier jumping
vim.opt.relativenumber = true

-- Enable mouse support (useful for scrolling, resizing)
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent. The wrapped portion is indented to align with the line it belongs to, preserving the visual block structure.
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show search results as you type
vim.opt.incsearch = true

-- Show a live preview of substitution commands
vim.opt.inccommand = "split"

-- Sets the delay (in ms) for triggering the 'CursorHold' event, used by many plugins.
vim.opt.updatetime = 250

-- Sets the time (in ms) to wait for the next key in a multi-key command.
vim.opt.timeoutlen = 500

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Set the max height of the completion menu
vim.opt.pumheight = 25

-- Enhance command-line completion
vim.opt.wildmode = "list:longest,full"

-- Configure how new windows should be opened
vim.opt.splitright = true -- Open new vertical splits to the right
vim.opt.splitbelow = true -- Open new horizontal splits below

-- Allow buffer change without saving
vim.opt.hidden = true

-- Allow backspace on indent, end of line or start
vim.opt.backspace = { "indent", "eol", "start" }

-- Keep a few lines of context around the cursor
vim.opt.scrolloff = 4

-- Automatically write the file when switching buffers
vim.opt.autowrite = true

-- Do not enable code folding by default
vim.opt.foldenable = false

-- Redraw only when necessary
vim.opt.lazyredraw = true

-- Disable swap/backup files, but enable persistent undo history
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Persist undo history across sessions by storing it in a dedicated directory
local undodir = vim.fn.stdpath("cache") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- Highlight the line the cursor is on
vim.opt.cursorline = true

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "  ", -- Use two spaces to represent a tab
  nbsp = "·", -- Character for non-breaking space
  trail = "·", -- Character for trailing whitespace
}

-- Set a fixed text width for formatting and visual guidance
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1" -- Highlight the column just after the text width

-- Disable audible and visual bells for errors
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.belloff = "all"

-- Prevents inserting extra spaces when joining lines
vim.opt.joinspaces = false

-- Used by the built-in syntax file for shell scripts to enforce POSIX compliance
vim.g.is_posix = 1

-- Configure how diagnostics are displayed
vim.diagnostic.config({
  -- Show errors inline
  virtual_text = true,
  -- Add a border to the diagnostic float window
  float = {
    source = "always",
    border = "rounded",
  },
  -- Use icons for signs in the gutter (requires a Nerd Font)
  signs = {
    active = true,
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})

vim.opt.showmode = false -- mode is in the statusline
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.mouse = 'a' -- default 'nvi' leaves out the command line

-- Scheduled: setting it can slow startup.
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

-- Soft wrap at word boundaries, keeping the line's indent.
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.writebackup = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split' -- live preview of :s

vim.opt.updatetime = 250 -- CursorHold delay (LSP highlight)
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
vim.opt.foldenable = false
vim.opt.cursorline = true
vim.opt.confirm = true -- ask instead of failing on :q with changes
vim.opt.winborder = 'rounded'

vim.opt.list = true
vim.opt.listchars = { tab = '» ', nbsp = '␣', trail = '·' }

vim.diagnostic.config {
  severity_sort = true,
  float = { source = 'if_many' },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    -- eslint is too noisy inline; it still shows in the float and pickers
    format = function(d) return d.source ~= 'eslint' and d.message or nil end,
  },
}

-- Set <space> as the leader key
-- This must be set before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install lazy.nvim if it's not already installed
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Load core configuration files
require 'core.options'
require 'core.keymaps'
require 'core.autocmds'
require 'core.commands'

-- Setup lazy.nvim and load all plugin specs from lua/plugins/
require('lazy').setup 'plugins'

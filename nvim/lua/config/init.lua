vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require("config.lazy_init")
require("config.set")
require("config.remap")
require("config.macros")

-- Bufferline --
vim.opt.termguicolors = true

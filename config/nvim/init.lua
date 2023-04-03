local api = vim.api
local map = api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.opt.nu = true
vim.opt.autoindent = true
vim.opt.expandtab = true

vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4

vim.opt.so = 10
vim.opt.mouse = "a"

vim.opt.textwidth = 80
vim.opt.showmatch = true
vim.opt.syntax = "on"

vim.opt.wildmenu = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.cursorline = true

vim.opt.listchars = {eol = '$', tab = '▸ ', trail = '·'}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("keybindings")


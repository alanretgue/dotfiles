local api = vim.api
local opt = vim.opt
local map = api.nvim_set_keymap
local opts = { noremap = true, silent = true }

opt.nu = true
opt.autoindent = true
opt.expandtab = true
opt.autoread = true

opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 2

opt.so = 10
opt.mouse = "a"

opt.textwidth = 80
opt.showmatch = true
opt.syntax = "on"

opt.wildmenu = true

opt.incsearch = true
opt.hlsearch = true
opt.cursorline = true

opt.list = true
opt.listchars:append {eol = '$', tab = '▸ ', trail = '·'}

if vim.g.neovide then
    vim.g.neovide_transparency = 0.95
    vim.g.transparency = 0.95
    -- vim.cmd(":cd C:\\\\Users\\alanr\\Documents\\Gistre")
end

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
opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

opt.modeline = false

require("keybindings")

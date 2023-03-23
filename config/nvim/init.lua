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

-- ###########################################
-- ############## Tab handling ###############
-- ###########################################
--
map('n', '<space>t+', '<Cmd>tabnew<CR>', opts)
-- Move to previous/next
map('n', '<space>tp', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<space>tn', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<space>tP', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<space>tN', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<space>t1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<space>t2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<space>t3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<space>t4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<space>t5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<space>t6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<space>t7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<space>t8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<space>t9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<space>tl', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<space>tm', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<space>tc', '<Cmd>BufferClose<CR>', opts)

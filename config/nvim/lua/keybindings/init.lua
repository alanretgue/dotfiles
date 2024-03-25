local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ###########################################
-- ############## Moving Text ################
-- ###########################################

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- ###########################################
-- ############## Exit terminal ##############
-- ###########################################

map('t', '<esc>', [[<C-\><C-n>]], opts)

-- ###########################################
-- ############## Remap motion ###############
-- ###########################################

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-m>', '<C-w>|', opts)
map('n', '<C-b>', '<C-w>=', opts)

map('n', '<C-c>', '<C-l>', opts)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

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
-- Close buffer
map('n', '<space>tc', '<Cmd>BufferClose<CR>', opts)

-- ###########################################
-- ############## Moving Text ################
-- ###########################################
--
-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- ###########################################
-- ################ Save Quit ################
-- ###########################################
--
-- Move selected line / block of text in visual mode
-- map("n", "<space>w", ":w", opts)
-- map("n", "<space>q", ":q", opts)
-- map("n", "<space>x", ":x", opts)

map('t', '<esc>', [[<C-\><C-n>]], opts)

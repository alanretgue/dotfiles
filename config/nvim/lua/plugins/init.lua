return {
    -- the colorscheme should be available when starting Neovim
    {
        "tanvirtin/monokai.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme monokai]])
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        },
        config = function()
            local lsp = require('lsp-zero').preset({
                name = 'minimal',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })

            -- (Optional) Configure lua language server for neovim
            lsp.nvim_workspace()

            lsp.setup()
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        cmd = 'TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "rust", "c", "lua", "vim", "help", "query" },

                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },
    {
        "folke/which-key.nvim",
        lazy = false,
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").register({
            })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        keys = {
            { "<space>w", "<cmd>w<cr>", desc = "Save" },
            { "<space>q", "<cmd>q<cr>", desc = "Quit" },
            { "<space>x", "<cmd>x<cr>", desc = "Save and Quit" },
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = 'material',
                }
            })
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
        keys = {
            { "<space>n", desc = "Tree selector" },
            { "<space>nt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle the Tree selector" },
            { "<space>ng", "<cmd>NvimTreeFocus<cr>", desc = "Select the Tree selector" },
            { "<space>nc", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse the Tree selector" },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<space>f", "<cmd>Telescope find_files<cr>", desc = "Find file with Telescope" },
            { "<space>r", "<cmd>Telescope lsp_references<cr>", desc = "Find references with Telescope" },
        },
    },
    {
        'romgrk/barbar.nvim',
        lazy = false,
        dependencies = 'nvim-tree/nvim-web-devicons',
        keys = {
            { "<space>t", desc = "Tab" },
            { "<space>t+", "<cmd>tabnew<cr>", desc = "New tab" },
            { '<space>tp', '<Cmd>BufferPrevious<CR>', desc= "Go to Previous Tab" };
            { '<space>tn', '<Cmd>BufferNext<CR>', desc= "Go to Next Tab" };
            { '<space>tP', '<Cmd>BufferMovePrevious<CR>', desc= "Move to Previous Tab" };
            { '<space>tN', '<Cmd>BufferMoveNext<CR>', desc= "Move to Next Tab" };
            { '<space>t1', '<Cmd>BufferGoto 1<CR>', desc= "Go to Tab 1" };
            { '<space>t2', '<Cmd>BufferGoto 2<CR>', desc= "Go to Tab 2" };
            { '<space>t3', '<Cmd>BufferGoto 3<CR>', desc= "Go to Tab 3" };
            { '<space>t4', '<Cmd>BufferGoto 4<CR>', desc= "Go to Tab 4" };
            { '<space>t5', '<Cmd>BufferGoto 5<CR>', desc= "Go to Tab 5" };
            { '<space>t6', '<Cmd>BufferGoto 6<CR>', desc= "Go to Tab 6" };
            { '<space>t7', '<Cmd>BufferGoto 7<CR>', desc= "Go to Tab 7" };
            { '<space>t8', '<Cmd>BufferGoto 8<CR>', desc= "Go to Tab 8" };
            { '<space>t9', '<Cmd>BufferGoto 9<CR>', desc= "Go to Tab 9" };
            { '<space>tl', '<Cmd>BufferLast<CR>', desc= "Go to Last Tab" };
            { '<space>tc', '<Cmd>BufferClose<CR>', desc= "Close Tab" };
        },
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                theme = 'hyper',
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = ' Apps',
                            group = 'DiagnosticHint',
                            action = 'Telescope app',
                            key = 'a',
                        },
                    },
                },
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
        'nvim-lua/plenary.nvim',
    },
    {
        'ThePrimeagen/harpoon',
        keys = {
            { "<space>h", desc = "Harpoon" },
            { "<space>h+", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "Add file to Harpoon" },
            { "<space>ha", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "Add file to Harpoon" },
            { "<space>hl", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "List files to Harpoon" },
            { "<space>hn", '<cmd>lua require("harpoon.ui").nav_next()<cr>', desc = "Next file to Harpoon" },
            { "<space>hp", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', desc = "Prev file to Harpoon" },
            { "<space>ht", '<cmd>lua require("harpoon.term").gotoTerminal(1)<cr>', desc = "Prev file to Harpoon" },
        },
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        keys = {
            { "<space><enter>", '<cmd>:ToggleTerm size=40 direction=float<cr>', desc = "Spawn floating Terminal" },
            { "<space>Tv", '<cmd>:ToggleTerm size=40 direction=vertical<cr>', desc = "Spawn floating Terminal" },
            { "<space>Th", '<cmd>:ToggleTerm size=20 direction=horizontal<cr>', desc = "Spawn floating Terminal" },
        },
        config = function()
            require("toggleterm").setup {
                persist_size = false,
                float_opts = { -- 'single' | 'double' | 'shadow' | 'curved'
                    border = "curved",
                },
            }
        end,
    },
    {
        'folke/todo-comments.nvim',
        lazy = true,
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<space>f", "<cmd>Telescope find_files<cr>", desc = "Find file with Telescope" },
            -- { "<space>r", "<cmd>Telescope lsp_references<cr>", desc = "Find references with Telescope" },
        },
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
        keys = {
            { "<space>s", desc = "TODO Search" },
            { "<space>sq", "<cmd>TodoQuickFix<cr>", desc = "TODO Quick Fix" },
            { "<space>sf", "<cmd>TodoTelescope keywords=TODO,FIX<cr>", desc = "TODO Quick Fix" },
        },
    },
}

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
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require'lspconfig'.rust_analyzer.setup{
                settings = {
                    ['rust-analyzer'] = {},
                },
            }
            require'lspconfig'.clangd.setup{}
        end,
    },
    {
        "ibhagwan/fzf-lua",
        lazy = true,
        keys = {
            -- { "<space>fz", "<cmd>FzfLua files<cr>", desc = "Fuzzy Fuzzer files" },
            { "<space>lr", "<cmd>FzfLua lsp_references<cr>", desc = "Fuzzy Fuzzer references" },
        },
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
            })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        config = function()
            require("lualine").setup({
                options = {
                    theme = 'material',
                }
            })
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        keys = {
            { "<space>g", "<cmd>LazyGit<cr>", desc = "Launch Lazy Git" },
        },
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
        },
    },
    {
        'romgrk/barbar.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
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
}

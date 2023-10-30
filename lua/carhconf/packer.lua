local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    use "karb94/neoscroll.nvim"

    -- theme
    use "Shatur/neovim-ayu"
    use 'shaunsingh/solarized.nvim'

    -- code marking
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })

            ts_update()
        end,
    }

    -- directory tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
            }
        end
    }

    -- LSP installer
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                opt = true,
                event = "BufReadPre",
                wants = { "mason-lspconfig.nvim", "lsp_signature.nvim", },
                config = function()
                    require("carhconf.lsp").setup()
                end,
                requires = {
                    "ray-x/lsp_signature.nvim",
                },
            },
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            { 'L3MON4D3/LuaSnip' },
        }

    }

    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup(
                require("carhconf.cfgpilot").opts()
            )
            require('carhconf.cfgpilot').setup()
        end,
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    use "nvim-lua/plenary.nvim"
    -- Fuzzy search
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        }
    }

    -- Laravel
    use {
        "adalessa/laravel.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
        },

        cmd = { "Sail", "Artisan", "Composer" },

        config = function()
            require("laravel").setup()
            require("telescope").load_extension("laravel")
        end,
    }

    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- git
    use {
        "tpope/vim-fugitive"
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup({
                open_mapping = [[¡]],
                hide_numbers = true,
                shade_terminals = true,
                shading_factor = -11,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "horizontal",
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "single",
                    width = 1000,
                    height = 1000,
                },
            })
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

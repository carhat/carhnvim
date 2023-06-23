vim.o.background = 'light'

if vim.o.background == 'dark' then
    require("ayu").setup({})
    require('ayu').colorscheme()
else
    vim.g.solarized_borders = true
    vim.g.solarized_disable_background = false

    require('solarized').set()
end

vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true

vim.g.terminal_color_background = '#575F66'

require("nvim-treesitter.configs").setup {
    -- :TSInstallInfo
    ensure_install = {
        "lua",
        "help",
        "comment",

        "bash",
        "make",
        "dockerfile",
        "dot",

        "gitconfig",
        "gitcommit",
        "gitignore",

        "html",
        "css",
        "javascript",

        "go",
        "gomod",
        "gosum",
        "gowork",

        "proto",
        "json",

        "php",
        "phpdoc",

        "sql",
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
}

local tree = require("nvim-tree")

vim.opt.termguicolors = true

tree.setup({
    renderer = {
        icons = {
            show = {
                git = true,
                file = true,
                folder = true,
                folder_arrow = true,
            },
            glyphs = {
                folder = {
                    arrow_closed = "⏵",
                    arrow_open = "⏷",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "⌥",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "⊖",
                    ignored = "◌",
                },
            },
        },
        special_files = {
            "Cargo.toml", "Makefile",
            "README.md", "readme.md",
            "Dockerfile",
        },
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
    },
})

local keymap = vim.keymap.set
local tree_api = require("nvim-tree.api")

local opts = { noremap = true, silent = true }

keymap("n", "<C-g>", tree_api.tree.toggle, opts)


require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local scroll_mapping = {}

scroll_mapping['˚'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }
scroll_mapping['∆'] = { 'scroll', { 'vim.wo.scroll', 'true', '250' } }

require('neoscroll.config').set_mappings(scroll_mapping)

require('lualine').setup()

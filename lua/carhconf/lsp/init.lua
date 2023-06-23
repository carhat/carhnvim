local M = {}

local lsp = require("lsp-zero").preset({
    name = 'recommended',
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    lsp.buffer_autoformat()

    require("carhconf.lsp.keymaps").setup(client, bufnr)
end)

local Opts = {
    servers = {
        "gopls",

        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "grammarly",
        "jsonls",
        "intelephense",
        "sqlls",
        "lua_ls",
    },
}

local lsp_signature = require("lsp_signature")
lsp_signature.setup {
    bind = true,
    handler_opts = {
        border = "rounded",
    },
}

local cfg = {
    lua_ls = lsp.nvim_lua_ls(),
    intelephense = {
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            intelephense = {
                diagnostics = {
                    undefinedFunctions = false,
                },
            },
        },
    },
}


local opts = {
    flags = {
        debounce_text_changes = 150,
    },
}

function Opts.opts(name)
    return cfg[name] or opts
end

function M.setup()
    require("carhconf.lsp.installer").setup(Opts)
    require("carhconf.lsp.completion").setup()
end

return M

local M = {}

local whichkey = require("which-key")
local tlscope = require("telescope.builtin")

local keymap = vim.keymap.set

local function keymappings(client, bufnr)
    local buf_opts = { buffer = 0 }
    local opts = { noremap = true, silent = true }

    -- Key mappings
    keymap("n", "K", vim.lsp.buf.hover, buf_opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)
    keymap("n", "[e", function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
    keymap("n", "]e", function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)

    -- Whichkey
    local keymap_l = {
        l = {
            name = "Code",
            r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            i = { "<cmd>LspInfo<CR>", "Lsp Info" },
            d = { tlscope.diagnostics, "Diagnostics" },
            t = { tlscope.treesitter, "Structure tree" },
        },
    }
    if client.server_capabilities.document_formatting then
        keymap_l.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
    end

    local keymap_g = {
        name = "Goto",
        d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        r = { tlscope.lsp_references, "References" },
        D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
        i = { tlscope.lsp_implementations, "Goto Implementation" },
        y = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
        c = { "<cmd> cclose<CR>", "Close quick list" },
    }


    whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
    whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
end

function M.setup(client, bufnr)
    keymappings(client, bufnr)
end

return M

vim.g.mapleader = ' '

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

local map = vim.keymap.set

local function next_diag(severity)
    vim.diagnostic.goto_next({ border = "rounded", severity = severity })
end
local function prev_diag(severity)
    vim.diagnostic.goto_prev({ border = "rounded", severity = severity })
end
local severity = vim.diagnostic.severity

map("n", "[e", function()
    prev_diag(severity.ERROR)
end, { noremap = true, desc = "Previous Error" })
map("n", "]e", function()
    next_diag(severity.ERROR)
end, { noremap = true, desc = "Next Error" })
map("n", "[w", function()
    prev_diag(severity.WARN)
end, { noremap = true, desc = "Previous Warning" })
map("n", "]w", function()
    next_diag(severity.WARN)
end, { noremap = true, desc = "Next Warning" })
map("n", "[d", function()
    vim.diagnostic.goto_prev({ border = "rounded" })
end, { noremap = true, desc = "Previous Diagnostic" })
map("n", "]d", function()
    vim.diagnostic.goto_next({ border = "rounded" })
end, { noremap = true, desc = "Next Diagnostic" })

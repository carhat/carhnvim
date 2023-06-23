local M = {}

function M.opts()
    local opts = {
        panel = {
            enabled = false,
        },
        suggestion = {
            enabled = false,
            debounce = 75,
            keymap = {
                accept = "<C-l>",
                next = "<C-]>",
                prev = "<C-[>"
            }
        },
        filetypes = {
            go = true,
            php = true,
            lua = true,
            proto = true,
            sql = true,
            gitcommit = true,
            json = true,
            yaml = true,
            markdown = true,
            ["."] = true,
        },
    }

    return opts
end

function M.setup()
end

return M

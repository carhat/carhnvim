local cmp = require('cmp')
local action = require('lsp-zero').cmp_action()

local M = {}

function M.has_words_before()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

function M.setup()
    cmp.setup({
        mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<Tab>'] = action.luasnip_supertab(),
            ['<S-Tab>'] = action.luasnip_shift_supertab(),
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        fields = { 'menu', 'abbr', 'kind' },
        -- here is where the change happens
        format = function(entry, item)
            local menu_icon = {
                copilot = '👨',
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = '💾',
                path = '📍',
                nvim_lua = 'Π',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
        preselect = 'item',
        completion = {
            completeopt = 'menu,menuone,noinsert'
        },
        sources = {
            -- Copilot Source
            { name = "copilot",  group_index = 2 },
            -- Other Sources
            { name = "nvim_lsp", group_index = 2 },
            { name = "path",     group_index = 2 },
            { name = "luasnip",  group_index = 2 },

        },
    })
end

return M

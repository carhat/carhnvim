local builtin   = require('telescope.builtin')
local which_key = require("which-key")

local M         = {
    mapping = {
        f = {
            f = { builtin.find_files, 'Find file' },
            g = { builtin.live_grep, 'Live grep' },
            b = { builtin.buffers, 'Manage buffers' },
            h = { builtin.help_tags, 'Help' },
        }
    }
}



function M.setup()
    local opts = {
        mode = 'n',
        silent = true,
        noremap = true,
        nowait = true,
    }

    which_key.register(M.mapping, opts)
end

return M

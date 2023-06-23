local server_provider = require("mason-lspconfig")
local lsp             = require("lspconfig")

local M               = {}


local lsp_zero = require("lsp-zero").preset({})

function M.setup(opts)
	require("mason").setup()

	server_provider.setup({
		ensure_installed = opts.servers,
	})

	server_provider.setup_handlers({
		function(name)
			local options = opts.opts(name)

			lsp[name].setup(options)
		end
	})

    lsp_zero.setup()
end

return M

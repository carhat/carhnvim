local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local api = require("nvim-tree.api")
local actions = require("nvim-tree.actions")

local mappings = {
	m = {
		name = "Tree",
		h = { api.tree.toggle_help, "Toggle help" },
		a = { api.fs.create, "Create" },
		d = { api.fs.remove, "Remove" },
		D = { api.fs.trash, "Trash" },
		m = { api.fs.rename, "Move" },
		c = { api.fs.copy.node, "Copy" },
		x = { api.fs.cut, "Cut" },
		p = { api.fs.paste, "Paste" },
		K = { actions.change_dir, "Paste" },
		j = { api.marks.navigate.next, "Go to next bookmark" },
		k = { api.marks.navigate.prev, "Go to prev bookmark" },
		-- J = {api.fs.paste, "Paste"},
		-- "Tab" = {api.node.open.preview, "Preview"},
	},
}

local opts = {
	mode = "n",                 -- NORMAL mode
	prefix = "<leader>",
	buffer = vim.fn.bufnr("NvimTree"), -- 0
	silent = true,              -- use silent when creating keymaps
	noremap = true,             -- use noremap when creating keymaps
	nowait = true,              -- use nowait when creating keymaps
}

which_key.register(mappings, opts)

local which_key = require("which-key")

local mappings = {
	t = {
		s = { '<CMD>G status<CR>', 'git status' },
		a = {
			w = {'<CMD>Gwrite<CR>', 'git add buffer'},
			l = {'<CMD>G add --all<CR>', 'git add --all'},
		},
		p = { '<CMD>G push<CR>', 'git push' },
		c = { '<CMD>G commit -v<CR>', 'git commit' },
		l = { '<CMD>G pull<CR>', 'git pull' }
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	silent = true, -- use silent when creating keymaps
	noremap = true, -- use noremap when creating keymaps
	nowait = true, -- use nowait when creating keymaps
}

which_key.register(mappings, opts)

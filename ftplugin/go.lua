local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	g = {
		name = "Golang Mode",
		t = {
			t = { '<CMD>GoTest<CR>', 'go test' },
			v = { '<CMD>GoTest -v<CR>', 'go test -v' },
			p = { '<CMD>GoTest -v -p<CR>', 'go test -v package' },
		},
		m = { '<CMD>GoModInit<CR>', 'go mod tidy' },
		b = { '<CMD>GoBuild %<CR>', 'go build' },
		r = {
			n = { '<CMD>GoRename<CR>', 'rename the field' },
		},
		d = { '<CMD>GoDoc<CR>', 'go doc' },
		c = { '<CMD>GoTermClose<CR>', 'close the terminal' },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	silent = true, -- use silent when creating keymaps
	prefix = '<leader>',
	noremap = true, -- use noremap when creating keymaps
	nowait = true, -- use nowait when creating keymaps
}

which_key.register(mappings, opts)

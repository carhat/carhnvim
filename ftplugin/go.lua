local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
	g = {
		name = "Golang Mode",
		t = {
			t = { '<CMD>GoTest -v<CR>', 'go test -v' },
            f = { '<CMD>GoTestFunc<CR>', 'go test function' },
            c = {
                a = { '<CMD>GoCoverage <CR>', 'go coverage all' },
                p = { '<CMD>GoCoverage -p<CR>', 'go coverage package' },
                t = { '<CMD>GoCoverage -t<CR>', 'go coverage toggle' },
                r = { '<CMD>GoCoverage -r<CR>', 'go coverage remove buffer highlighting' },
                R = { '<CMD>GoCoverage -R<CR>', 'go coverage remove all highlighting' },
                s = { '<CMD>GoCoverage -m<CR>', 'go coverage statistic' },
            },
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

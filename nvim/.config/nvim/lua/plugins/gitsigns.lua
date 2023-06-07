require 'core.plugins.plugin'

local function load_fn(use)
	use {
		'lewis6991/gitsigns.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}
end

local function configure_fn()
	require 'gitsigns'.setup {
		signs = {
			add          = { text = '+' },
			change       = { text = '~' },
			delete       = { text = '-' },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
		}
	}
end

return Plugin:new {
	load_fn = load_fn,
	configure_fn = configure_fn
}

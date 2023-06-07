-- helpers

local function bind(...)
	vim.keymap.set(...)
end

-- opts
vim.opt.number = true
vim.opt.cursorline = true
-- others
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.encoding = 'utf-8'

local opts = { noremap = true, silent = true }

-- key bindings
bind('n', ';', ':', opts)
bind('v', '<', '<gv', opts)
bind('v', '>', '>gv', opts)
bind('n', '>', '>>', opts)
bind('n', '<', '<<', opts)
-- select
bind('v', '<AS-Left>', '^', opts)
bind('v', '<AS-Right>', '$', opts)
bind('i', '<AS-Left>', '<Esc>v^', opts)
bind('i', '<AS-Right>', '<Esc>v$', opts)

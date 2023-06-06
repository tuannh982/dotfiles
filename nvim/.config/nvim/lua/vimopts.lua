-- helpers

local function bind(...)
    vim.keymap.set(...)
end

-- opts
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.encoding = 'utf-8'

-- key bindings
bind('n', ';', ':')

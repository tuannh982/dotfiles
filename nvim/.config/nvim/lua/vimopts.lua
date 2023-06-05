-- helpers

local function bind(...)
    vim.keymap.set(...)
end

-- opts
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- key bindings
bind('n', ';', ':')

require 'core.plugins.plugin'
local utils = require 'core.utils'

local function load_fn(use)
    vim.g.barbar_auto_setup = false
    use 'romgrk/barbar.nvim'
    require 'barbar'.setup {
        animation = false,
        sidebar_filetypes = {
            Outline = { event = 'BufWinLeave', text = nil }
        }
    }
end

local function configure_fn()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', opts)
    vim.keymap.set('n', '<A-Right>', '<Cmd>BufferNext<CR>', opts)
    if utils.is_macos then
        vim.keymap.set('n', '∑', '<Cmd>BufferClose<CR>', opts)
        vim.keymap.set('n', '„', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
    else
        vim.keymap.set('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)
        vim.keymap.set('n', '<A-W>', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
    end
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

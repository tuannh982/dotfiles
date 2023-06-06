require 'core.plugins.plugin'

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
    -- vim.keymap.set('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)
    -- vim.keymap.set('n', '<A-W>', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
    -- vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
    -- vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

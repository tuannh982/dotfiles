require 'core.plugins.plugin'

local function load_fn(use)
    use({
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    })
end

local function configure_fn()
    local api = require 'nvim-tree.api'
    local function on_attach(bufnr)
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        vim.keymap.set('n', '<Right>', api.node.open.edit, opts('Expand'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Expand'))
        vim.keymap.set('n', '<Left>', api.node.navigate.parent_close, opts('Collapse'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Collapse'))
    end
    require 'nvim-tree'.setup {
        diagnostics = {
            enable = true,
        },
        renderer = {
            group_empty = true,
        },
        on_attach = on_attach
    }
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

require 'core.plugins.plugin'

local function load_fn(use)
    use({
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    })
end

local function configure_fn()
    require 'nvim-tree'.setup {
        diagnostics = {
            enable = true,
        },
        renderer = {
            group_empty = true,
        },
    }
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

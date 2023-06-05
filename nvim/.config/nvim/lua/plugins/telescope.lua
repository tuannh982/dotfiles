require 'core.plugins.plugin'

local function load_fn(use)
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
end

local function configure_fn()
    local telescope = require 'telescope'
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

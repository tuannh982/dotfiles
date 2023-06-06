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
            add       = { text = 'A' },
            change    = { text = 'M' },
            delete    = { text = 'D' },
            -- topdelete    = { text = 'TD' },
            -- changedelete = { text = 'CD' },
            untracked = { text = 'U' },
        }
    }
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

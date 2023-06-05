require 'core.plugins.plugin_manager'
require 'core.plugins.plugin'

local test = Plugin:new{
    load_fn = function(use)
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            requires = {{'nvim-lua/plenary.nvim'}}
        }
    end,
}

-- function load_plugins(use)
--     use {
--         'nvim-telescope/telescope.nvim',
--         tag = '0.1.1',
--         requires = {{'nvim-lua/plenary.nvim'}}
--     }
-- end

local manager = PluginManager:new{}
manager:install({ test })
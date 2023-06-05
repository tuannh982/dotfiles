require 'plugin_manager'

local manager = PluginManager:new{}
manager:install(load_plugins)

function load_plugins(use)
    -- the manager itself
    use 'wbthomason/packer.nvim'
    -- empty
end

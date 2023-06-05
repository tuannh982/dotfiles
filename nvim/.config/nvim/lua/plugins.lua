require 'core.plugins.plugin_manager'
require 'core.plugins.plugin'

local manager = PluginManager:new {}
manager:install({
    require 'plugins.telescope',
    require 'plugins.lsp'
})

require 'core.plugins.plugin_manager'
require 'core.plugins.plugin'

local manager = PluginManager:new {}
manager:install({
    require 'plugins.telescope':dependsOn {
        require 'plugins.autocomplete'
    },
    require 'plugins.lsp':dependsOn {
        require 'plugins.autocomplete'
    },
    require 'plugins.autocomplete',
    require 'plugins.filetree':dependsOn {
        require 'plugins.gitsigns'
    },
    require 'plugins.bar':dependsOn {
        require 'plugins.gitsigns',
    },
    require 'plugins.gitsigns'
})

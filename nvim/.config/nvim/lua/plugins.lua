require 'core.plugins.plugin_manager'
require 'core.plugins.plugin'

local manager = PluginManager:new {}
manager:install({
    require 'plugins.telescope',
    require 'plugins.lsp':dependsOn { require 'plugins.treesitter' },
    require 'plugins.filetree':dependsOn { require 'plugins.gitsigns' },
    require 'plugins.bar':dependsOn { require 'plugins.gitsigns' },
    require 'plugins.diffview',
    Plugin:new { load_fn = function(use) use 'tpope/vim-sleuth' end },
    require 'plugins.theme'

})

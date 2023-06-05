require 'core.lsp.language_server'

local common = require 'plugins.lsp.common'
local language_server = 'lua_ls'

local function configure()
    require("neodev").setup {}
    require('lspconfig')[language_server].setup {
        on_attach = common.on_attach(),
        flags = common.flags()
    }
end

local server = MasonManagedLanguageServer:new({
    name = 'Lua',
    language_server = language_server,
    configure_fn = configure
})

return server

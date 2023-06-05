require 'core.lsp.language_server'

local common = require 'plugins.lsp.common'
local language_server = 'gopls'

local function configure()
    require('lspconfig')[language_server].setup {
        on_attach = common.on_attach(),
        flags = common.flags()
    }
end

local server = MasonManagedLanguageServer:new({
    name = 'Go',
    language_server = language_server,
    configure_fn = configure
})

return server

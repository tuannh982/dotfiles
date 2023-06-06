require 'core.lsp.language_server'

local common = require 'plugins.lsp.common'
local language_server = 'lua_ls'

local function configure()
    require("neodev").setup {}
    require('lspconfig')[language_server].setup {
        on_attach = common.on_attach(),
        flags = common.flags(),
        settings = {
            Lua = {
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                },
                telemetry = {
                    enable = false,
                },
            }
        }
    }
end

local server = MasonManagedLanguageServer:new({
    name = 'Lua',
    language_server = language_server,
    configure_fn = configure
})

return server

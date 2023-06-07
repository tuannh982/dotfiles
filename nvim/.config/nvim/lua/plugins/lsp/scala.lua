require 'core.lsp.language_server'

local common = require 'plugins.lsp.common'

local function configure()
    local metals = require 'metals'
    local metals_config = metals.bare_config()
    metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
    }
    metals_config.capabilities = require 'cmp_nvim_lsp'.default_capabilities()
    metals_config.on_attach = common.on_attach()
    local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'scala', 'sbt', 'java' },
        callback = function()
            metals.initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
    })
end

local server = LanguageServer:new({
    name = 'Scala',
    configure_fn = configure
})

return server

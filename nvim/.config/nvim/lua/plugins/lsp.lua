require 'core.plugins.plugin'
local s = require('core.utils').switch

local servers = {
    require 'plugins.lsp.lua',
    require 'plugins.lsp.go',
    require 'plugins.lsp.scala'
}

local function load_fn(use)
    -- for neovim dev
    use 'folke/neodev.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    -- scala
    use {
        'scalameta/nvim-metals',
        requires = { 'nvim-lua/plenary.nvim' }
    }
end

local function configure_fn()
    require('mason').setup()
    -- autocomplete
    local cmp = require 'cmp'
    -- setup servers
    local mason_managed_ls = {}
    for _, server in ipairs(servers) do
        s.switch(getmetatable(server),
            s.case(MasonManagedLanguageServer, function()
                table.insert(mason_managed_ls, server:languageServer())
            end),
            s.default(function()
                -- empty
            end)
        )
    end
    require('mason-lspconfig').setup {
        ensure_installed = mason_managed_ls,
    }
    for _, server in ipairs(servers) do
        server:configure()
    end
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

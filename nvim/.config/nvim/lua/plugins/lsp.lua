require 'core.plugins.plugin'
local s = require('core.utils').switch

local servers = {
    require 'plugins.lsp.lua',
    require 'plugins.lsp.go',
    require 'plugins.lsp.scala'
}

local function load_fn(use)
    -- auto complete
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
        },
    })
    -- auto pairs
    use 'windwp/nvim-autopairs'
    -- lspkind
    use 'onsails/lspkind-nvim'
    -- for neovim dev
    use 'folke/neodev.nvim'
    --
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    -- scala
    use {
        'scalameta/nvim-metals',
        requires = { 'nvim-lua/plenary.nvim' }
    }
end

local function configure_autocomplete()
    require 'nvim-autopairs'.setup {}
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'buffer' },
        },
        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
        }),
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
            })
        },
    })
end

local function configure_lsp_servers()
    require 'mason'.setup()
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

local function configure_fn()
    configure_autocomplete()
    configure_lsp_servers()
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

require 'core.plugins.plugin'
local s = require('core.utils').switch

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
end

local function configure_fn()
    require 'nvim-autopairs'.setup {}
    local cmp = require('cmp')
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
        })
    })
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

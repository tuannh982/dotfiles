require 'core.plugins.plugin'

local function load_fn(use)
    use 'sindrets/diffview.nvim'
end


local function configure_fn()
    -- empty
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

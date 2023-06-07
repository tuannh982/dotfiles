require 'core.plugins.plugin'

local function load_fn(use)
    use 'navarasu/onedark.nvim'
end


local function configure_fn()
    require 'onedark'.load()
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

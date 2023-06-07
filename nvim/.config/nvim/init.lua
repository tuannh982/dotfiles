require 'preload'
require 'plugins'
require 'vimopts'
require 'postload'


-- live reload command
local user_module_patterns = {
    '^preload$',
    '^postload$',
    '^plugins$',
    '^vimopts$',
    '^plugins.',
    '^core.'
}

local function reload_user_modules(args)
    for name, _ in pairs(package.loaded) do
        for _, pattern in ipairs(user_module_patterns) do
            if name:match(pattern) then
                package.loaded[name] = nil
            end
        end
    end
    vim.api.nvim_command 'luafile ~/.config/nvim/init.lua'
end

vim.api.nvim_create_user_command('ReloadUserModules', reload_user_modules, { nargs = '?' })

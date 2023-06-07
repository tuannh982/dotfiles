require 'preload'
require 'plugins'
require 'vimopts'
require 'postload'

local user_module_patterns = {
    '^preload$',
    '^postload$',
    '^plugins$',
    '^vimopts$',
    '^plugins.',
    '^core.'
}

-- reload
function _G.reload_user_modules()
    for name, _ in pairs(package.loaded) do
        for _, pattern in ipairs(user_module_patterns) do
            if name:match(pattern) then
                package.loaded[name] = nil
            end
        end
    end
    vim.api.nvim_command 'luafile ~/.config/nvim/init.lua'
end

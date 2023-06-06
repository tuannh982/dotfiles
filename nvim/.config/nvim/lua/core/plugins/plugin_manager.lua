local utils = require 'core.utils'

PluginManager = {
    install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim' -- default install path
}

function PluginManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

local function to_edges_list(...)
    local edges = {}
    for _, mod in ipairs(...) do
        for _, dependency in ipairs(mod.depends_on) do
            table.insert(edges, { dependency, mod })
        end
    end
    return edges
end

function PluginManager:install(plugins)
    local use_function = function(use)
        -- the manager itself
        use 'wbthomason/packer.nvim'
        -- perform topo sort
        local sorted_plugins = utils.topo_sort(to_edges_list(plugins))
        -- load plugins
        for _, plugin in ipairs(sorted_plugins) do
            plugin:load(use)
        end
        -- configure plugins
        for _, plugin in ipairs(sorted_plugins) do
            plugin:configure()
        end
    end
    local is_plugin_manager_already_installed = utils.glob_path_exists(self.install_path)
    if not is_plugin_manager_already_installed then
        local git_repo = 'https://github.com/wbthomason/packer.nvim'
        print('Installing packer.nvim')
        utils.git_clone(git_repo, self.install_path)
        vim.api.nvim_command 'packadd packer.nvim'
        print('packer.nvim installed')
    end
    if vim._update_package_paths then
        vim._update_package_paths()
    end
    local packer = require 'packer'
    packer.startup(use_function)
    if not is_plugin_manager_already_installed then
        vim.api.nvim_command 'PackerSync'
    end
    vim.api.nvim_command 'PackerInstall'
end

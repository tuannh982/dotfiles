require 'core.plugins.plugin'
local utils = require 'core.utils'

local function load_fn(use)
    utils.check_command_exists('make')
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
end

local function configure_fn()
    utils.check_command_exists('rg')
    local telescope = require 'telescope'
    telescope.load_extension('fzf')
    telescope.setup {
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden',
                '-g',
                '!{.git}',
            },
            dynamic_preview_title = true,
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
        }
    }
    -- settings

    -- bindings
    local telescope_builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>f', telescope_builtin.find_files)
    vim.keymap.set('n', '<leader>F', telescope_builtin.live_grep)
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

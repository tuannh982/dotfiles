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
    utils.check_command_exists('fd')
    local telescope = require 'telescope'
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
    telescope.load_extension('fzf')
    -- settings

    -- bindings
    local telescope_builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>f', function()
        telescope_builtin.find_files {
            find_command = { 'fd', '--type=f', '--color=never', '--hidden', '--exclude', '.git' }
        }
    end)

    vim.keymap.set('n', '<leader>g', telescope_builtin.live_grep)
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

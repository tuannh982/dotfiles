require 'core.plugins.plugin'

local function load_fn(use)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'
end

local treesitters = {
    'bash', 'c', 'cpp', 'css', 'diff', 'dockerfile', 'gitignore', 'glsl', 'go', 'gomod', 'hcl',
    'html', 'java', 'javascript', 'json', 'latex', 'lua', 'make', 'puppet', 'python', 'regex',
    'ruby', 'rust', 'scala', 'scss', 'sql', 'toml', 'tlaplus', 'vim', 'yaml'
}

local function configure_fn()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = treesitters,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = 'o',
                toggle_hl_groups = 'i',
                toggle_injected_languages = 't',
                toggle_anonymous_nodes = 'a',
                toggle_language_display = 'I',
                focus_language = 'f',
                unfocus_language = 'F',
                update = 'R',
                goto_node = '<cr>',
                show_help = '?',
            },
        }
    }
end

return Plugin:new {
    load_fn = load_fn,
    configure_fn = configure_fn
}

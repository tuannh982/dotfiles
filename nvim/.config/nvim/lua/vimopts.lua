
local function set(...)
    vim.keymap.set(...) 
end

set('n', '<Left>', 'b')
set('n', '<Right>', 'w')
set('n', '<leader><Left>', '0')
set('n', '<leader><Right>', '$')
set('n', 'w', 'k')
set('n', 's', 'j')
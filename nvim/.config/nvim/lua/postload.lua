local is_filetree_open = require 'nvim-tree.view'.is_visible()

if not is_filetree_open then
	vim.api.nvim_command 'NvimTreeOpen'
end

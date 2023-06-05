local utils = {}

function utils.git_clone(url, path)
    vim.fn.system({'git', 'clone', '--depth', '1', url, path})
end

function utils.glob_path_exists(glob)
    return vim.fn.len(vim.fn.glob(glob)) > 0
end

return utils

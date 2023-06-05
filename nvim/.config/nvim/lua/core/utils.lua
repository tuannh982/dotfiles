local utils = {
    switch = {}
}

function utils.git_clone(url, path)
    vim.fn.system({ 'git', 'clone', '--depth', '1', url, path })
end

function utils.glob_path_exists(glob)
    return vim.fn.len(vim.fn.glob(glob)) > 0
end

-- switch

function utils.switch.switch(n, ...)
    for _, v in ipairs { ... } do
        if v[1] == n or v[1] == nil then
            return v[2]()
        end
    end
end

function utils.switch.case(n, f)
    return { n, f }
end

function utils.switch.default(f)
    return { nil, f }
end

return utils

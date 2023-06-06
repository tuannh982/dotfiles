local utils = {
    switch = {}
}

function utils.git_clone(url, path)
    vim.fn.system({ 'git', 'clone', '--depth', '1', url, path })
end

function utils.glob_path_exists(glob)
    return vim.fn.len(vim.fn.glob(glob)) > 0
end

function utils.check_command_exists(command)
    vim.fn.system({ 'command', '-v', command })
    local exit_code = tonumber(vim.v.shell_error)
    if exit_code ~= 0 then
        error(string.format('command %s is not exists'), command)
    end
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

-- copy

function utils.copy(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = {}
    s[obj] = res
    for k, v in pairs(obj) do res[utils.copy(k, s)] = utils.copy(v, s) end
    return setmetatable(res, getmetatable(obj))
end

-- sorts

function utils.topo_sort(vertices, edges)
    local graph = {}
    local in_deg = {}
    for _, edge in ipairs(edges) do
        local from = edge[1]
        local to = edge[2]
        if graph[from] == nil then graph[from] = { to } else table.insert(graph[from], to) end
        if in_deg[to] == nil then in_deg[to] = 1 else in_deg[to] = in_deg[to] + 1 end
    end
    local stack = {}
    for node, _ in pairs(vertices) do
        if in_deg[node] == nil then
            table.insert(stack, node)
        end
    end
    if #stack == 0 then
        error('could not found any start node')
    end
    local result = {}
    local seen = {}
    while #stack > 0 do
        -- build frontier list
        local frontier = {}
        for _, node in ipairs(stack) do
            table.insert(result, node)
            seen[node] = true
            if graph[node] ~= nil then
                for _, to_node in ipairs(graph[node]) do
                    if frontier[to_node] == nil then frontier[to_node] = true end
                end
            end
        end
        stack = {} -- clear stack
        for node, _ in pairs(frontier) do
            if seen[node] then
                error('cyclic dependency detected')
            else
                table.insert(stack, node)
            end
        end
    end
    return result
end

return utils

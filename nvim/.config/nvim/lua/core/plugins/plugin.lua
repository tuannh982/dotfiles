local utils = require 'core.utils'

Plugin = {
    load_fn = function(use)
        -- empty
    end,
    configure_fn = function()
        -- empty
    end,
    depends_on = { --[[empty]] }
}

function Plugin:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Plugin:load(use)
    self.load_fn(use)
end

function Plugin:configure()
    self.configure_fn()
end

function Plugin:dependsOn(dependencies)
    local copied_deps = utils.copy(self.depends_on)
    for _, dep in ipairs(dependencies) do
        table.insert(copied_deps, dep)
    end
    self.depends_on = copied_deps
    return self
end

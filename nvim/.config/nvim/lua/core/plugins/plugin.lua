Plugin = {
    load_fn = function(use)
        -- empty
    end,
    configure_fn = function()
        -- empty
    end
}

function Plugin:new(o, load, configure)
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
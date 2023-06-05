LanguageServer = {
    name = '',
    configure_fn = function()
        -- empty
    end
}

function LanguageServer:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function LanguageServer:configure()
    self.configure_fn()
end

--

MasonManagedLanguageServer = LanguageServer:new {
    language_server = ''
}

function MasonManagedLanguageServer:languageServer()
    return self.language_server
end

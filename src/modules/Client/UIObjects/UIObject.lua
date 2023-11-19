local require = require(script.Parent.loader).load(script)

local UIObject = {}
UIObject.__index = UIObject

function UIObject.new(title, parent)
    local self = {}
    setmetatable(self, UIObject)

    self._title = title
    self._parent = parent

    UIObject:render()
    return self
end

function UIObject:render()
    
end

function UIObject:onAction()
    print("Test")
end

return UIObject
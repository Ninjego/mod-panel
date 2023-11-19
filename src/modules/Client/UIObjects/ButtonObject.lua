local require = require(script.Parent.loader).load(script)

local Blend = require("Blend")
local Maid = require("Maid")
local UIObject = require("UIObject")

local ButtonObject = setmetatable({}, UIObject)
ButtonObject.__index = ButtonObject

function ButtonObject.new(title, parent)
    local self = UIObject.new(title, parent)
    setmetatable(self, ButtonObject)

    self._maid = Maid.new()

    return self
end

function ButtonObject:render()
    local render = Blend.New "Frame" {
        Parent = self._parent;
        Name = "ButtonObject";
        Size = UDim2.fromOffset(100, 100);
        BackgroundTransparency = 1;
        [Blend.Children] = {
            Blend.New "TextButton" {
                Position = UDim2.fromScale(0.0251, 0.5);
                AnchorPoint = Vector2.new(0, 0.5);
                Size = UDim2.fromScale(0.5, 0.75);
                BackgroundColor3 = Color3.fromRGB(46, 50, 66);
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json");
                Text = self._title;
                TextColor3 = Color3.fromRGB(255, 255, 255);
                TextSize = 25;
                [Blend.Children] = {
                    Blend.New "UICorner" {
                        CornerRadius = UDim.new(0, 8);
                    };
                    Blend.New "UIGradient" {
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(0.623489, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(222, 222, 222))
                        });
                        Rotation = 90;
                    };
                    Blend.New "UITextSizeConstraint" {
                        MaxTextSize = 25;
                    };
                };
                [Blend.OnEvent "Activated"] = self:onAction()
            };
        };
    }

    self._maid:GiveTask(render:Subscribe(function(gui)
    
    end))
end

return ButtonObject
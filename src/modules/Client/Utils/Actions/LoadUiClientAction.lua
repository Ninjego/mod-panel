local require = require(script.Parent.loader).load(script)

local UpdateImageAction = require("UpdateImageClientAction")
local UpdateTitleAction = require("UpdateTitleClientAction")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

return {
    args = {

    },
    execute = function()
        UpdateImageAction.execute()
        UpdateTitleAction.execute(player.Name)
        return "Success"
    end
}
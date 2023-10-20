local require = require(script.Parent.loader).load(script)

local UpdateImageAction = require("UpdateImageClientAction")
local UpdateTitleAction = require("UpdateTitleClientAction")
local RegisterToggleAction = require("RegisterToggleClientAction")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

return {
    args = {

    },
    execute = function(maid)
        UpdateImageAction.execute(maid)
        UpdateTitleAction.execute(maid, player.Name)
        RegisterToggleAction.execute(maid)
        return "Success"
    end
}
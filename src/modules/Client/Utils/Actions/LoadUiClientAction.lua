local require = require(script.Parent.loader).load(script)

local UpdateImageAction = require("UpdateImageClientAction")
local UpdateTitleAction = require("UpdateTitleClientAction")
local RegisterToggleAction = require("RegisterToggleClientAction")
local UpdatePlayersAction = require("UpdatePlayersClientAction")
local TextExample = require("TestExample")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

return {
    args = {

    },
    execute = function(maid)
        maid:GiveTask(UpdateImageAction.execute(maid))
        maid:GiveTask(UpdateTitleAction.execute(maid, player.Name))
        maid:GiveTask(RegisterToggleAction.execute(maid))
        maid:GiveTask(UpdatePlayersAction.execute(maid))
        maid:GiveTask(TextExample.execute(maid))
        return "Success"
    end
}
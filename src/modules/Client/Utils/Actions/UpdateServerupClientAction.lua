local require = require(script.Parent.loader).load(script)

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local ClockClientUtil = require("ClockClientUtil")

return {
    args = {

    },
    execute = function()
        local modUi = PlayerGui:FindFirstChild("ModUi")

        if not(modUi) then
            return "Unsuccessful"
        end

        modUi.Main.InformationFrame.UpTimeFrame.ValueLabel.Text = ClockClientUtil.secondsToClock(math.floor(workspace.DistributedGameTime))
        return "Success"
    end
}
local require = require(script.Parent.loader).load(script)

local Promise = require("Promise")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
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

        modUi.Main.InformationFrame.PlayersFrame.ValueLabel.Text = #game:GetService("Players"):GetPlayers()
        return "Success"
    end
}
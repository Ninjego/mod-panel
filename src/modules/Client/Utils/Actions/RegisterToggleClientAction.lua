local require = require(script.Parent.loader).load(script)

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local UpdateServerupAction = require("UpdateServerupClientAction")

return {
    args = {

    },
    execute = function(maid)
        local modUi = PlayerGui:FindFirstChild("ModUi")

        if not(modUi) then
            return "Unsuccessful"
        end

        maid:GiveTask(modUi.ToggleButton.Activated:Connect(function()
            UpdateServerupAction.execute()
            modUi.Frame.Visible = not modUi.Frame.Visible
        end))

        maid:GiveTask(modUi.Frame.Topbar.ExitButton.Activated:Connect(function()
            modUi.Frame.Visible = false
        end))
        return "Success"
    end
}
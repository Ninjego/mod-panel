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
            modUi.Main.Visible = not modUi.Main.Visible
        end))

        maid:GiveTask(modUi.Main.Topbar.ExitButton.Activated:Connect(function()
            modUi.Main.Visible = false
        end))
    end
}
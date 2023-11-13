local require = require(script.Parent.loader).load(script)

local Players = game:GetService("Players")

local ButtonObject = require("ButtonObject")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")


return {
    args = {
        
    },
    execute = function(maid, title)
        local modUi = PlayerGui:FindFirstChild("ModUi")

        if not(modUi) then
            return "Unsuccessful"
        end

        local banUser = ButtonObject.new("Ban User", modUi.Frame.Modules.ModuleMain)
        local kickUser = ButtonObject.new("Kick User", modUi.Frame.Modules.ModuleMain)
        local killUser = ButtonObject.new("Kill User", modUi.Frame.Modules.ModuleMain)
        local resetHealth = ButtonObject.new("Reset Health", modUi.Frame.Modules.ModuleMain)

        banUser:render()
        kickUser:render()
        killUser:render()
        resetHealth:render()
        return "Success"
    end
}
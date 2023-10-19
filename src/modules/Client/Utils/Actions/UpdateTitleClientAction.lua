local Players = game:GetService("Players")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")


return {
    args = {
        
    },
    execute = function(title)
        local modUi = PlayerGui:FindFirstChild("ModUi")

        if not(modUi) then
            return "Unsuccessful"
        end

        modUi.Main.Topbar.Title.TitleLabel.Text = title  
    end
}
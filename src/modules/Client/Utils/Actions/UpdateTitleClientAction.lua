local Players = game:GetService("Players")

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

        modUi.Frame.Topbar.Title.TitleLabel.Text = title
        modUi.Frame.Main.MainFrame.NameLabel.Text = title
        return "Success"
    end
}
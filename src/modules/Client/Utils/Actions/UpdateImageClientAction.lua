local require = require(script.Parent.loader).load(script)

local PlayerThumbnailUtils = require("PlayerThumbnailUtils")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

return {
    args = {

    },
    execute = function(maid)    
        maid:GiveTask(PlayerThumbnailUtils.promiseUserThumbnail(player.UserId):Then(function(image)
            local modUi = PlayerGui:FindFirstChild("ModUi")

            if not(modUi) then
                return "Unsuccessful"
            end

            modUi.Frame.Topbar.Title.PlayerImage.Image = image
            modUi.Frame.Main.MainFrame.AvatarImage.Image = image
        end))
        return "Success"
    end
}
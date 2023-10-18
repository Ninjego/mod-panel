local ServerStorage = game:GetService("ServerStorage")

return {
    args = {
        name = "AddPanel"
    },
    execute = function(player, maid)
        local modUi = ServerStorage:FindFirstChild("ModUi")
 
        if not(modUi) then
            warn("Couldn't find mod ui")
            return "Unsuccessful"
        end

        local clonedUi = modUi:Clone()
        clonedUi.Parent = player:WaitForChild("PlayerGui")
        return "Success"
    end
}
local ModeratorUtil = {}

local Administrators = {
    [136400539] = true,
}

function ModeratorUtil.evalutePlayer(player)

    if(Administrators[player.UserId]) then
        return true
    end
    return false
    
end

function ModeratorUtil.sendClient(player)

    

end

return ModeratorUtil
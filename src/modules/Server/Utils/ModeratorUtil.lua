local require = require(script.Parent.loader).load(script)

local ClientActionsUtil = require("ClientActionsUtil")

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

function ModeratorUtil.sendClient(action, player, maid)

    if not(maid.remoteEvent:IsA("RemoteEvent")) then
        return
    end

    local action = maid:GiveTask(ClientActionsUtil.fireAction(action, player, maid))
    print(action)
end

return ModeratorUtil
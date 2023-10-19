local require = require(script.Parent.loader).load(script)

local ActionsUtil = require("ActionsUtil")

local ModeratorUtil = {}

local Administrators = {
    [136400539] = true,
}

-- Checks if the player is an administrator
function ModeratorUtil.evalutePlayer(player)

    if(Administrators[player.UserId]) then
        return true
    end
    return false
    
end

function ModeratorUtil.sendClient(action, player, maid, ...)
    if not(maid.remoteEvent:IsA("RemoteEvent")) then
        return "Couldn't find remote event"
    end

    maid.remoteEvent:FireClient(player, action, ...)
end

-- Sends action to client
function ModeratorUtil.executeAction(action, player, maid)

    local action = maid:GiveTask(ActionsUtil.fireAction(action, player, maid))
    return action
end

return ModeratorUtil
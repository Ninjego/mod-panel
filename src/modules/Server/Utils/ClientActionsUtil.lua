local require = require(script.Parent.loader).load(script)

local clientActionsUtil = {}

-- List of action functions.
local ClientActions = {
    ["AddPanel"] = function(player, maid)
        maid.remoteEvent:FireClient(player, "loadUI", true)
        return "Success"
    end,
}

function clientActionsUtil.fireAction(action, player, maid)

    if not(ClientActions[action]) then
        return "Couldn't find client action"
    end

    maid:GiveTask(ClientActions[action](player, maid))
    return "Success"
end

return clientActionsUtil
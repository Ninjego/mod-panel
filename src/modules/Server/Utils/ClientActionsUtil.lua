local require = require(script.Parent.loader).load(script)

local clientActionsUtil = {}

-- List of action functions.
local ClientActions = {
    ["AddPanel"] = function(player, maid)
        maid.remoteEvent:FireClient(player, "AddPanel")
    end,
}

function clientActionsUtil.fireAction(action, player, maid)

    if not(ClientActions[action]) then
        return
    end

    maid:GiveTask(ClientActions[action](player, maid))
end

return clientActionsUtil
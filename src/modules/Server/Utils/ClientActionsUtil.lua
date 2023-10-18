local require = require(script.Parent.loader).load(script)

local clientActionsUtil = {}

-- List of action functions.
local sendClientActions = {
    ["AddPanel"] = function(player, maid)
        print("Adding panel")
        return true
    end,
}

function clientActionsUtil.fireAction(action, player, maid)

    if not(sendClientActions[action]) then
        return
    end

    maid:GiveTask(sendClientActions[action](player, maid))
    return
end

return clientActionsUtil
local require = require(script.Parent.loader).load(script)

local Promise = require("Promise")

local clientActionsUtil = {}

-- List of action functions.
--[[local ClientActions = {
    ["AddPanel"] = function(player, maid)
        maid.remoteEvent:FireClient(player, "loadUI", true)
        return "Success"
    end,
}]]--

-- Checks for client action and executes it
function clientActionsUtil.fireAction(action, player, maid)

    local actionClass = require(action .. "Action")

    if not(actionClass) then
        warn("Couldn't find specified action class,", action)
        return "Unsuccessful"
    end

    maid:GiveTask(actionClass.execute(player, maid))
    return "Success"
end

return clientActionsUtil
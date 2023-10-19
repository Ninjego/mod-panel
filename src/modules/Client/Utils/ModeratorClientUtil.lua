local require = require(script.Parent.loader).load(script)

local Maid = require("Maid")

local ModeratorClientUtil = {}

-- Handles payload from server
function ModeratorClientUtil.onClient(action, ...)
    local actionClass = require(action .. "ClientAction")

    if not(actionClass) then
        warn("Couldn't find specified action class,", action)
        return "Unsuccessful"
    end

    local maid = Maid.new()
    maid:GiveTask(actionClass.execute(...))
    return "Success"
end

return ModeratorClientUtil
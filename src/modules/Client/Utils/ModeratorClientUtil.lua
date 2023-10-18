local require = require(script.Parent.loader).load(script)

local Maid = require("Maid")

local actionList = {

    ["loadUI"] = function(show)
        print(show)
        return "Success"
    end

}

local ModeratorClientUtil = {}

function ModeratorClientUtil.onClient(action, ...)
    if not(actionList[action]) then
        return "Couldn't find action"
    end

    local maid = Maid.new()

    maid:GiveTask(actionList[action](...))
    return "Success"
end

return ModeratorClientUtil
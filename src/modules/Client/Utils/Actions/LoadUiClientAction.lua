local require = require(script.Parent.loader).load(script)

local UpdateImageAction = require("UpdateImageClientAction")

return {
    args = {

    },
    execute = function()
        UpdateImageAction.execute()

        return "Success"
    end
}
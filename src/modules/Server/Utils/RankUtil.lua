local require = require(script.Parent.loader).load(script)

local DataStoreService = game:GetService("DataStoreService")
local Promise = require("Promise")
local DataStore = require("DataStore")

local RankUtil = {}

local loadedRanks = {

}

function RankUtil.loadRanks(maid)
    local dataStore = DataStore.new(DataStoreService:GetDataStore("data"), "moderator-ranks")
    maid:GivePromise(dataStore:Load(1)):Then(function(value)
        loadedRanks = value
    end)

    return "Success"
end

function RankUtil.getData()
    return loadedRanks
end

return RankUtil
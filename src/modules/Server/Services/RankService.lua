local require = require(script.Parent.loader).load(script)

local Players = game:GetService("Players")
local Maid = require("Maid")

local RankService = {}
RankService.ServiceName = "ModPanelService"

-- Rank Service initializing
function RankService:Init(serviceBag)
    assert(not self._serviceBag, "Already initialized")
    self._serviceBag = assert(serviceBag, "No serviceBag")
    self._maid = Maid.new()
end

function RankService:Start()
    print("Started Rank Service")
end

function RankService:Destroy()
    self._maid:DoCleaning()
end 

return RankService

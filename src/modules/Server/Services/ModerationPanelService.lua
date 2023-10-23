local require = require(script.Parent.loader).load(script)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Maid = require("Maid")
local ModeratorUtil = require("ModeratorUtil")

local ModPanelService = {}
ModPanelService.ServiceName = "ModPanelService"

-- Mod Panel Service initializing
function ModPanelService:Init(serviceBag)
    assert(not self._serviceBag, "Already initialized")
    self._serviceBag = assert(serviceBag, "No serviceBag")
    self._maid = Maid.new()
    self._moderatorUtil = ModeratorUtil

    self._rankService = self._serviceBag:GetService(require("RankService"))
    self._maid.remoteEvent = Instance.new("RemoteEvent", ReplicatedStorage)
end

-- Checks for administrators connecting
function ModPanelService:Start()
    print("Started Mod Panel Service")

    self._maid:GiveTask(Players.PlayerAdded:Connect(function(player)
         self:LoadPanel(player)
    end))
end

-- Loads panel for each administrator connecting
function ModPanelService:LoadPanel(player)
    local isAdmin = self._moderatorUtil.evalutePlayer(player)
    if not(isAdmin) then return end

    self._maid:GiveTask(self._moderatorUtil.executeAction("AddPanel",player, self._maid))
end

function ModPanelService:Destroy()
    self._maid:DoCleaning()
end 

return ModPanelService

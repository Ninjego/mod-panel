local require = require(script.Parent.loader).load(script)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Maid = require("Maid")
local ModeratorUtil = require("ModeratorUtil")

local ModPanelService = {}
ModPanelService.ServiceName = "ModPanelService"

function ModPanelService:Init(serviceBag)
    assert(not self._serviceBag, "Already initialized")
    self._serviceBag = assert(serviceBag, "No serviceBag")
    self._maid = Maid.new()
    self._moderatorUtil = ModeratorUtil

    self._maid.remoteEvent = Instance.new("RemoteEvent", ReplicatedStorage)
end

function ModPanelService:Start()
    print("Started ModPanel Service")

    self._maid:GiveTask(Players.PlayerAdded:Connect(function(player)
         self:LoadPanel(player)
    end))

end

function ModPanelService:LoadPanel(player)
    local isAdmin = self._moderatorUtil.evalutePlayer(player)
    if not(isAdmin) then return end

    self._maid:GiveTask(self._moderatorUtil.sendClient("AddPanel",player, self._maid))
end

function ModPanelService:Destroy()
    self._maid:DoCleaning()
end 

return ModPanelService

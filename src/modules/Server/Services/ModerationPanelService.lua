local require = require(script.Parent.loader).load(script)

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

    self._moderatorUtil.sendClient(player)
end

function ModPanelService:Destroy()
    self._maid:DoCleaning()
end 

return ModPanelService

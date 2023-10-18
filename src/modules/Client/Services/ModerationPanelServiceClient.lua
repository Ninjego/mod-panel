local require = require(script.Parent.loader).load(script)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Maid = require("Maid")
local ModeratorClientUtil = require("ModeratorClientUtil")

local RemoteEvent

local ModPanelServiceClient = {}
ModPanelServiceClient.ServiceName = "ModPanelServiceClient"

function ModPanelServiceClient:Init(serviceBag)
    assert(not self._serviceBag, "Already initialized")
    self._serviceBag = assert(serviceBag, "No serviceBag")
    self._maid = Maid.new()
end

-- Listens for client remote event
function ModPanelServiceClient:Start()
    RemoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")

    self._maid:GiveTask(RemoteEvent.OnClientEvent:Connect(ModeratorClientUtil.onClient))
end

function ModPanelServiceClient:Destroy()
    self._maid:DoCleaning()
end 

return ModPanelServiceClient
